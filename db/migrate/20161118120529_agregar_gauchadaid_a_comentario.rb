class AgregarGauchadaidAComentario < ActiveRecord::Migration
  def change
  	add_column :comentarios, :gauchada_id, :integer
  end
end
