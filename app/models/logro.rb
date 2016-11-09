class Logro < ActiveRecord::Base
	validates :etiqueta,uniqueness:true
	validates :puntosMin,uniqueness:true
	validates :puntosMax,uniqueness:true
end
