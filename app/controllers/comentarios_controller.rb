class ComentariosController < ApplicationController
	include ApplicationHelper
	before_filter :verificar_usuario, :only => [:create, :new]

	def show
		@comentario = Comentario.find(params[:id])
	end

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
		back_id = @comentario.favor_id

		if @comentario.save
			respond_to do |format|
				format.html {redirect_to favor_path(:id => back_id), notice: 'Comentario creado!'}
				if @comentario.favor.comentarios.count > 1
					format.js
				end
			end
		else
			render 'new'
		end
	end

	private
	def comentario_params
		params.require(:comentario).permit(:texto, :favor_id)
	end
end
