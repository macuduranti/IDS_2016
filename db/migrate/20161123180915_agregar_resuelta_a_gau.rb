class AgregarResueltaAGau < ActiveRecord::Migration
  def change
  	add_column :favors, :resuelta,:boolean
  end
end
