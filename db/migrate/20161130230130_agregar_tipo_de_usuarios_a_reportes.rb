class AgregarTipoDeUsuariosAReportes < ActiveRecord::Migration
  def change
  	add_column :reportes,:tipodeusuarios,:integer
  end
end
