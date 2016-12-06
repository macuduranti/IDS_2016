class AgregarUsuarioIdYComentarioIdARespuesta < ActiveRecord::Migration
  def change
  	add_column :answers,:comentario_id,:integer
  	add_column :answers,:usuario_id,:integer
  end
end
