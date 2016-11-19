class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :usuario_id
      t.text :texto

      t.timestamps null: false
    end
  end
end
