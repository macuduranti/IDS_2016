class UsuariosController < ApplicationController
	include ApplicationHelper
  	before_filter :verificar_usuario, :only => [:show]

	def show
		@usuario = Usuario.find(params[:id])
		if (@usuario == @current_usuario)
			@pend = params[:pend]
		end
	end

	#def destroy
	#	@usuario = Usuario.find(params[:id])
    #	@usuario.destroy
    #	if @usuario.destroy
    #	    redirect_to root_url, notice: "Usuario eliminado."
    #	end
	#end
end
