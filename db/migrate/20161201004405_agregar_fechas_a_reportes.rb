class AgregarFechasAReportes < ActiveRecord::Migration
  def change
  	add_column :reportes,:fechainicial,:date
  	add_column :reportes,:fechafinal,:date
  end
end
