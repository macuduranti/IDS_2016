dbclass CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.string :etiqueta
      t.integer :puntosMin
      t.integer :puntosMax

      t.timestamps null: false
    end
  end
end
