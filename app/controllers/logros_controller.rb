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
  	 end	 
	 ultimo=Logro.order(:puntosMin).last
  	 if(ultimo.id == @logro.id) then # si elimino el ultimo logro no actualiza el rango del anterior
  	 	@logro.destroy
  	 	return redirect_to logros_path, notice: 'Logro Eliminado'
  	 end
  	 logros = Logro.all.order(:puntosMin)
	 logros.each_cons(2) do |l,ls|
	 	if(ls.id == @logro.id) then # si elimino un logro que este entre dos logros, actualizara el puntosMax del anterior a eliminar y le colocara el puntosMax del que queramos eliminar
	 		l.puntosMax = @logro.puntosMax
	 		@logro.destroy
	 		l.save
  	 		return redirect_to logros_path, notice: 'Logro Eliminado'
  	 	end
  	 end
  end
  
  def create
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	if(@l.puntosMin >= @l.puntosMax) then
  		return redirect_to new_logro_path, notice: 'Rango de puntos invalido'
  	end
  	logros = Logro.all.order(:puntosMin)
	logros.each_cons(2) do |l,ls|
  	 if( l.etiqueta == @l.etiqueta || l.puntosMax == @l.puntosMin || ls.puntosMin == @l.puntosMax) then # nombre o puntos invalidos
  	 	return redirect_to logros_path, notice: 'Parametros invalidos'
  	 end
  	 if( l.puntosMin < @l.puntosMin && l.puntosMax > @l.puntosMax) then
  	 	return redirect_to logros_path, notice: 'El rango no puede estar entre un logro ya existente'
  	 end
  	 if(l.puntosMin < @l.puntosMin && l.puntosMax == @l.puntosMax) then # para insertar un logro en un rango existente, el que queremos meter debe tener iguales puntos maximos del que ya estaba
  	 	l.puntosMax = @l.puntosMin - 1
  	 	l.save
  	 	@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado-Insertado'
  	 end
  	 if( l.puntosMax > @l.puntosMin && ls.puntosMin < @l.puntosMax) then # para insertar un logro entre dos logros existentes
  	 	l.puntosMax = @l.puntosMin - 1
  	 	l.save
  	 	ls.puntosMin = @l.puntosMax + 1
  	 	ls.save
  	 	@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado'
 	end
    end
    ultimo = Logro.last #porque el each_cons tiene problemas con el ultimo
    if( ultimo.puntosMin < @l.puntosMin && ultimo.puntosMax > @l.puntosMax) then
  	 	return redirect_to logros_path, notice: 'El rango no puede estar entre un logro ya existente'
  	 end
  	 if(ultimo.puntosMin < @l.puntosMin && ultimo.puntosMax == @l.puntosMax) then
  	 	ultimo.puntosMax = @l.puntosMin - 1
  	 	ultimo.save
  	 	@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado-Insertado'
 	end
 	if(ultimo.puntosMax > @l.puntosMin) then
 		ultimo.puntosMax = @l.puntosMin - 1
 		ultimo.save
 		@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado'
 	end
 	if(ultimo.puntosMax == (@l.puntosMin - 1)) then
 		@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado'
 	else
 		ultimo.puntosMax = @l.puntosMin - 1
 		ultimo.save
 		@l.save
 	    return redirect_to logros_path, notice: 'Logro Creado'
 	end
  end

  def update
  	@logro=Logro.find(params[:id])
  	@l=Logro.new(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	if(@l.puntosMin >= @l.puntosMax) then
  		return redirect_to edit_logro_path(@logro), notice: 'Rango de puntos invalido'
  	end
#  	logros = Logro.all
#	logros.each do |l|
#  	 if( l.etiqueta == @l.etiqueta ) then
#  	 	return redirect_to edit_logro_path(@logro), notice: 'Logro existente'
#  	 end
#  	end
  	@logro.update(etiqueta: params[:logro][:etiqueta], puntosMin: params[:logro][:puntosMin], puntosMax: params[:logro][:puntosMax])
  	redirect_to logros_path, notice: 'Logro Actualizado'
  end

  def edit
  	@logro=Logro.find(params[:id])
  end
 
end
