class ComentariosController < ApplicationController
	def new
		if usuario_signed_in?
			@favor_id = params[:favor_id] 
			@comentario = Comentario.new
		else
			return redirect_to gauchadas_path, notice: "Para comentar debes estar registrado"
		end
	end
	def create
		@comentario = Comentario.new(comentario_params)
		@comentario.usuario_id = current_usuario.id
		@comentario.save
		redirect_to gauchadas_path, notice: 'Comentario creado!'
	end

	private
	def comentario_params
		params.require(:comentario).permit(:texto, :favor_id)
	end
end
