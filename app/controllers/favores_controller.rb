class FavoresController < ApplicationController
	include ApplicationHelper
  	before_filter :verificar_usuario, :only => [:show]

	def index
	end
	def show
		@favor = Favor.find(params[:id])
	end
end