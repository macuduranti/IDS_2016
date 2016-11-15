class AgregarConfirmacionEmailAUsuarios < ActiveRecord::Migration
  def change
	add_column :usuarios, :confirmation_token, :string   
	add_column :usuarios, :confirmed_at, :datetime 
	add_column :usuarios, :confirmation_sent_at, :datetime 
	add_column :usuarios, :unconfirmed_email, :string   
  end
end
