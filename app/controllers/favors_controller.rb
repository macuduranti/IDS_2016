class FavorsController < ApplicationController
	def index
		@favores = Favor.where(nil)
  		@favores = @favores.ubicacion(params[:ubicacion]) if params[:ubicacion].present?
  		@favores = @favores.titulo(params[:titulo]) if params[:titulo].present?
  		@favores = @favores.dueno(params[:dueno]) if params[:dueno].present?
	end

	# A list of the param names that can be used for filtering the Product list
	def filtro_params(params)
  		params.slice(:ubicacion)
	end

	def show
		@favor = Favor.find(params[:id])
		@comentario = Comentario.new
	end
	def new
		if usuario_signed_in?
			if current_usuario.puntos > 0
			@favor = Favor.new
			else
				return redirect_to gauchadas_path, notice: "Para solicitar una gauchada debes tener puntos"
			end
		else
			return redirect_to gauchadas_path, notice: "Para solicitar una gauchada debes iniciar sesión"
		end
	end
	def create
		@fa=Favor.new(titulo: params[:favor][:titulo], descripcion: params[:favor][:descripcion], ubicacion: params[:favor][:ubicacion], foto: params[:favor][:foto], usuario_id: current_usuario.id)
		if @fa.foto == ""
			@fa.foto = "http://i.imgur.com/HBEa2Op.png"
		end
		@fa.save
		u = current_usuario
		u.puntos = u.puntos - 1
		u.save
		redirect_to gauchadas_path, notice: 'Gauchada creada exitosamente'
	end

	def destroy
		@favor = Favor.find(params[:id])
		if usuario_signed_in? & (current_usuario.admin || current_usuario.id = @favor.usuario_id)
			@favor.destroy
			redirect_to gauchadas_path, notice: "Gauchada Eliminada"
		else
			redirect_to gauchadas_path, notice: "No tienes permiso para realizar esta acción. Solo el solicitante o el administrador pueden eliminar una gauchada"
		end	
	end	

	def edit
		@gauchada=Favor.find(params[:id])
	end
	def update
		@gauchada=Favor.find(params[:id])
		if params[:favor][:foto] == ""
			@gauchada.update(titulo: params[:favor][:titulo], descripcion: params[:favor][:descripcion], ubicacion: params[:favor][:ubicacion], foto: "http://i.imgur.com/HBEa2Op.png")
			redirect_to favor_path(:id => @gauchada.id), notice: 'Gauchada actualizada!'
		else
		@gauchada.update(titulo: params[:favor][:titulo], descripcion: params[:favor][:descripcion], ubicacion: params[:favor][:ubicacion], foto: params[:favor][:foto])
		redirect_to favor_path(:id => @gauchada.id), notice: 'Gauchada actualizada!'
		end
	end
end