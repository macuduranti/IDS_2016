class RemovePuntosMaxFromLogro < ActiveRecord::Migration
  def change
    remove_column :logros, :puntosMax, :integer
  end
end
