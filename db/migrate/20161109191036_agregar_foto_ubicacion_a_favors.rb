class AgregarFotoUbicacionAFavors < ActiveRecord::Migration
  def change
  	add_column :favors,:foto,:string
  	add_column :favors,:ubicacion,:string
  end
end
