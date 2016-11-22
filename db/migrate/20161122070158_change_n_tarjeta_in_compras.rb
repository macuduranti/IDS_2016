class ChangeNTarjetaInCompras < ActiveRecord::Migration
  def change
  	change_column :compras, :n_tarjeta, :string
  end
end
