class AgregarFechaYSexoAUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :fecha_de_nacimiento, :datetime
  	add_column :usuarios, :es_mujer, :boolean
  end
end
