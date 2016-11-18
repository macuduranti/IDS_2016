class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :monto
      t.integer :usuario_id
      t.integer :n_tarjeta

      t.timestamps null: false
    end
  end
end
