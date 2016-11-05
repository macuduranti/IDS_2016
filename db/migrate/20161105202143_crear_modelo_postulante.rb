class CrearModeloPostulante < ActiveRecord::Migration
  def change
  	create_table :postulantes do |t|
  		t.integer :id_user
  		t.integer :id_gauchada

  		t.timestamps
  	end
  end
end
