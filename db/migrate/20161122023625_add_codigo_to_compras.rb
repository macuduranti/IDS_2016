class AddCodigoToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :cvv, :string
  end
end
