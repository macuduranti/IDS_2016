class CreatePostulacions < ActiveRecord::Migration
  def change
    create_table :postulacions do |t|
      t.integer :usuario_id
      t.integer :gauchada_id

      t.timestamps null: false
    end
  end
end
