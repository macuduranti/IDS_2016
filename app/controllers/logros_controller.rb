class LogrosController < ApplicationController

  def new
  	@logro=Logro.new
  end

  def index
  end

  def show
  end

  def destroy
  	 @logro=Logro.find(params[:id])
  	 @logro.destroy
  	 redirect_to logros_path, notice: 'Logro Eliminado'
  end
  
  def create
  	 @l=Logro.create(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
 	 redirect_to logros_path, notice: 'Logro Creado'
  end

  def update
  	@logro=Logro.find(params[:id])
  	@logro.update(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	redirect_to logros_path, notice: 'Logro Actualizado'
  end

  def edit
  	@logro=Logro.find(params[:id])
  end
 
end
