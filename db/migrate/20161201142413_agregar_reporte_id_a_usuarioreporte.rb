class AgregarReporteIdAUsuarioreporte < ActiveRecord::Migration
  def change
  	add_column :usuarioreportes,:reporte_id,:integer
  end
end
