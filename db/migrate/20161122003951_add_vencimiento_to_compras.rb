class AddVencimientoToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :mes, :string
    add_column :compras, :ano, :string
  end
end
