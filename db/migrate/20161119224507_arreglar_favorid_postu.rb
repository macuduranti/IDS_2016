class ArreglarFavoridPostu < ActiveRecord::Migration
  def change
  	remove_column :postulacions,:favor_id
  end
end
