class AddTitularToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :titular, :string
  end
end
