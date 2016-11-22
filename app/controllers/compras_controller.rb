class ComprasController < ApplicationController
  def new
    @compra=Compra.new
  end

  def index
  end

  def confirmar
    @c=Compra.new(monto: params[:monto], n_tarjeta: params[:n_tarjeta], mes: params[:mes], ano: params[:ano], cvv: params[:cvv])
  end

  def agregar
    @c=Compra.new(monto: params[:monto], n_tarjeta: params[:n_tarjeta], mes: params[:mes], ano: params[:ano], cvv: params[:cvv])
    u = current_usuario
    @c.usuario_id = u.id
    @c.save
    u.puntos = u.puntos + @c.monto
    u.save
    redirect_to root_path, notice: 'Operacion exitosa, se agregaran inmediatamente los puntos a tu cuenta!'
  end

  def show
  end

  def destroy
  end

  def create
    @c=Compra.new(monto: params[:compra][:monto], n_tarjeta: params[:compra][:n_tarjeta], mes: params[:compra][:mes], ano: params[:compra][:ano], cvv: params[:compra][:cvv])
    if !(is_number?(params[:compra][:n_tarjeta])) then
      return redirect_to compras_path, notice: 'Operacion invalida, ingrese un numero de tarjeta valido'
    end
    if (params[:compra][:n_tarjeta].length != 16) then
      return redirect_to compras_path, notice: 'Operacion invalida, el numero de la tarjeta debe ser de 16 digitos'
    end
    n = Integer(params[:compra][:n_tarjeta])
    if (n<0) then #cuando viene un numero menor que 0
      return redirect_to compras_path, notice: 'Operacion invalida, ingrese un numero de tarjeta valido!'
    end
    if !(is_number?(params[:compra][:cvv])) then
      return redirect_to compras_path, notice: 'Operacion invalida, ingrese un numero de codigo de seguridad valido'
    end
    if (params[:compra][:cvv].length != 3) then
      return redirect_to compras_path, notice: 'Operacion invalida, el codigo de seguridad debe ser de 3 digitos'
    end
    n = Integer(params[:compra][:cvv])
    if (n<0) then #cuando viene un codigo menor que 0
      return redirect_to compras_path, notice: 'Operacion invalida, ingrese un numero de codigo de seguridad valido!'
    end
    n = Integer(params[:compra][:mes])
    n1 = Integer(params[:compra][:ano])
    if ( (n <= 10) && (n1 == 16) ) then
      return redirect_to compras_path, notice: 'Tarjeta vencida'
    end

    redirect_to compras_confirmar_path(:monto => params[:compra][:monto], :n_tarjeta => params[:compra][:n_tarjeta], :mes => params[:compra][:mes], :ano => params[:compra][:ano], :cvv => params[:compra][:cvv])
  end

  def update
  end

  def edit
  end
end