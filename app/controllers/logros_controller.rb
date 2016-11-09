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
  	 if @logro.id == 1 then
  	 	redirect_to logros_path, notice: 'No se puede eliminar este logro'
  	 else
  	 	@logro.destroy
  	 	redirect_to logros_path, notice: 'Logro Eliminado'
  	 end
  end
  
  def create
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	if(@l.puntosMin >= @l.puntosMax) then
  		return redirect_to new_logro_path, notice: 'Rango de puntos invalido'
  	end
  	logros = Logro.all
	logros.each do |l|
  	 if( l.etiqueta == @l.etiqueta ) then
  	 	return redirect_to logros_path, notice: 'Logro existente'
  	 end
  	end
  	@l.save
 	redirect_to logros_path, notice: 'Logro Creado'
  end

  def update
  	@logro=Logro.find(params[:id])
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	if(@l.puntosMin >= @l.puntosMax) then
  		return redirect_to edit_logro_path(@logro), notice: 'Rango de puntos invalido'
  	end
  	logros = Logro.all
	logros.each do |l|
  	 if( l.etiqueta == @l.etiqueta ) then
  	 	return redirect_to edit_logro_path(@logro), notice: 'Logro existente'
  	 end
  	end
  	@logro.update(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	redirect_to logros_path, notice: 'Logro Actualizado'
  end

  def edit
  	@logro=Logro.find(params[:id])
  end
 
end
