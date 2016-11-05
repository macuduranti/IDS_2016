class Favor < ActiveRecord::Base
	has_many :postulantes
	belongs_to :usuario
end
