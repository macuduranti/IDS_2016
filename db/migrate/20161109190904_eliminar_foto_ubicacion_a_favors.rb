class EliminarFotoUbicacionAFavors < ActiveRecord::Migration
  def change
  	remove_column :favors,:foto
  	remove_column :favors,:ubicacion 
  end
end
