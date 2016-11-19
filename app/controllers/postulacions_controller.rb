class PostulacionsController < ApplicationController
	def new
		@postulacion = Postulacion.new()
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
end