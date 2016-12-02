class CreateUsuarioreportes < ActiveRecord::Migration
  def change
    create_table :usuarioreportes do |t|
      t.integer :usuario_id
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
