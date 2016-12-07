class FavorsController < ApplicationController
	include ApplicationHelper
	before_filter :verificar_usuario, :only => [:show, :new, :create, :destroy, :update, :edit]


	def index
		@favores = Favor.filtrar(params[:resueltas], params[:ubicacion], params[:titulo])
	end

	# A list of the param names that can be used for filtering the Product list
	def filtro_params(params)
  		params.slice(:ubicacion)
	end

	def show
		@favor = Favor.find(params[:id])
		@comentarios = @favor.comentarios
		@comentario = Comentario.new
		@respuesta = Answer.new
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
		@fa.resuelta = false;
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
	    if current_usuario.id == Favor.find(params[:id]).usuario_id 
			@gauchada=Favor.find(params[:id])
		else
			redirect_to(root_path, alert: 'No puedes acceder a esa página.')
		end
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

	def finalizar_gauchada
		if Favor.find(params[:id]).tiene_elegido?
			@gauchada = Favor.find(params[:id])
		else
			redirect_to favor_path(:id => @gauchada.id), notice: 'Esta gauchada no tiene un candidato asignado por lo que no puede resolverse'
		end
	end

	def gauchada_resuelta
		g = Favor.find(params[:id])
		MyMailer.resolvio_gauchada(g).deliver_now
		g.resolver		
		redirect_to root_path, notice:'Gauchada resuelta! :D'		
	end

	def gauchada_no_resuelta
		g = Favor.find(params[:id])
		MyMailer.no_resolvio_gauchada(g).deliver_now
		g.no_resolver
		redirect_to root_path, notice:'La gauchada volvio al listado :('	
	end
end