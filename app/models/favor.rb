class Favor < ActiveRecord::Base
	belongs_to :usuario
	has_many :postulacions, dependent: :destroy
	has_many :comentarios, dependent: :destroy
	
end
