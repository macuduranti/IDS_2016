class PostulacionsController < ApplicationController
	def new
		@postulacion = Postulacion.new()
		@favor_id = params[:favor_id]
	end
	def create
		@postulacion = Postulacion.new(postulacion_params)
		@postulacion.usuario_id = current_usuario.id
		@postulacion.save
		redirect_to gauchadas_path, notice: 'Te postulaste!'
	end
	def postulacion_params
		params.require(:postulacion).permit(:descripcion, :favor_id)
	end

	def show
		@postulacion = Postulacion.find(params[:id])
	end

	def destroy
		@postulacion = Postulacion.find(params[:id])
		@postulacion.destroy
		redirect_to gauchadas_path, notice: 'Cancelaste tu oferta'
	end

	def elegir_usuario
		p = Postulacion.find(params[:id])
		p.elegido = true
		p.save
		redirect_to favor_path(:id => p.favor_id), notice:'Elegiste quien resuelve tu gauchada!'
	end
end