class AgregarFotoYUbicacionAUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :foto, :string
  	add_column :usuarios, :ubicacion, :string
  end
end
