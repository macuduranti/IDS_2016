class Usuarioreporte < ActiveRecord::Base
	default_scope -> { order("cantidad desc") }
	belongs_to :reporte
end
