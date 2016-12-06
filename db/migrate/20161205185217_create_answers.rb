class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :texto

      t.timestamps null: false
    end
  end
end
