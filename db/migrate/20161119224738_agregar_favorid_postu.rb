class AgregarFavoridPostu < ActiveRecord::Migration
  def change
  	add_column :postulacions, :favor_id, :integer
  end
end
