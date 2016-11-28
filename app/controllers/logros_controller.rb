class LogrosController < ApplicationController
  include ApplicationHelper
  before_filter :verificar_admin

  def new
  	@l=Logro.new
  end

  def index
    @l=Logro.new
  end

  def show
  end

  def destroy
  	 @logro=Logro.find(params[:id])
  	 if @logro.id == 1 then
  	 	redirect_to logros_path, notice: 'No se puede eliminar este logro'
  	 end
  	 @logro.destroy
  	 redirect_to logros_path, notice: 'Logro eliminado'
  end
  
  def create
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin])
  	logros = Logro.all.order(:puntosMin)
  	puts @l.puntosMin
	logros.each do |l|
  	 if( l.etiqueta == @l.etiqueta || l.puntosMin == @l.puntosMin ) then # nombre o puntos invalidos
  	 	return redirect_to logros_path, notice: 'Ya existe un logro con esa etiqueta o puntaje'
  	 end
    end
    if @l.save
      redirect_to logros_path, notice: 'Logro creado exitosamente'
    else
      render 'new'
    end
  end

  def update
  	@logro=Logro.find(params[:id])
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin])
  	logros = Logro.all.order(:puntosMin)
	logros.each do |l|
		if(l.etiqueta == @l.etiqueta || l.puntosMin == @l.puntosMin) then
			if (l.id != @logro.id) then
				return redirect_to logros_path, notice: 'Ya existe un logro con esa etiqueta o puntaje'
			end
		end
	end
  	@logro.update(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin])
  	redirect_to logros_path, notice: 'Logro Actualizado'
  end

  def edit
  	@logro=Logro.find(params[:id])
  end
 
end
