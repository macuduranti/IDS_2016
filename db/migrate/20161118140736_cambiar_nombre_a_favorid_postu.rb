class CambiarNombreAFavoridPostu < ActiveRecord::Migration
  def change
  	rename_column :postulacions,:gauchada_id,:favor_id
  end
end
