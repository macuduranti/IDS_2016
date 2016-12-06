class AnswersController < ApplicationController
	include ApplicationHelper
	before_filter :verificar_usuario, :only => [:create, :new, :destroy]


	def new
		if usuario_signed_in?
			@comentario_id = params[:comentario_id]
			@respuesta = Answer.new
		else
			return redirect_to gauchadas_path, notice: "Para responder debes estar registrado"
		end
	end
	def create
		@respuesta = Answer.new(respuesta_params)
		@respuesta.usuario_id = current_usuario.id
		back_id = @respuesta.comentario.favor.id
		if @respuesta.save
			#MyMailer.respuesta_mail(@respuesta).deliver_now
			respond_to do |format|
				format.html {redirect_to favor_path(:id => back_id), notice: 'Respuesta enviada!'}
				format.js
			end
		else
			render 'new'
		end
	end

	def destroy
		@respuesta = Answer.find(params[:id])
		if usuario_signed_in? & (current_usuario.id = @respuesta.usuario_id)
			@respuesta.destroy
			redirect_to @respuesta.comentario.favor, notice: "Respuesta Eliminada"
		else
			redirect_to @respuesta.comentario.favor, notice: "No tienes permiso para realizar esta acción."
		end	
	end	

	private
	def respuesta_params
		params.require(:answer).permit(:texto, :comentario_id)
	end
end
