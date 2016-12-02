class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.integer :usuario_id
      t.string :titulo
      t.integer :tipo
      t.datetime :fechainicial
      t.datetime :fechafinal
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
