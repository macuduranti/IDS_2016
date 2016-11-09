class CambiarDefaultPuntos < ActiveRecord::Migration
  def change
  	change_column_default(:usuarios,:puntos, 1)
  end
end
