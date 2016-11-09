class FavoresController < ApplicationController
	def index
	end
	def show
		@favor = Favor.find(params[:id])
	end
end