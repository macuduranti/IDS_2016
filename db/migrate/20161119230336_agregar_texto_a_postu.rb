class AgregarTextoAPostu < ActiveRecord::Migration
  def change
  	add_column :postulacions,:descripcion,:text
  end
end
