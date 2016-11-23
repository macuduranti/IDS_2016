class AgregarElegidoAPostulacion < ActiveRecord::Migration
  def change
  	add_column :postulacions,:elegido,:boolean
  end
end
