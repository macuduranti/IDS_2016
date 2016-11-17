class UsuariosController < ApplicationController
	include ApplicationHelper
  	before_filter :verificar_usuario, :only => [:show]

	def show
		@usuario = Usuario.find(params[:id])
	end
end
