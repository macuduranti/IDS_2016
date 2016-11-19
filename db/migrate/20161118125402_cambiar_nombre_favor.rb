class CambiarNombreFavor < ActiveRecord::Migration
  def change
  	rename_column :comentarios,:gauchada_id,:favor_id
  end
end
