class EliminarFechasAReportes < ActiveRecord::Migration
  def change
  	remove_column :reportes,:fechainicial
  	remove_column :reportes,:fechafinal
  end
end
