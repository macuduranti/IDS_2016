class AgregarCamposAUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :nombre, :string
  	add_column :usuarios, :apellido, :string
  	add_column :usuarios, :admin, :boolean, default: false
  	add_column :usuarios, :puntos, :integer, default: 0
  end
end
