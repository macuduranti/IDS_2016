class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :ubicacion

      t.timestamps null: false
    end
  end
end
