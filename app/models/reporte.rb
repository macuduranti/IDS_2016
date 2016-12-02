class Reporte < ActiveRecord::Base
	default_scope -> { order("created_at desc") }
	has_many :usuarioreportes, dependent: :destroy
	belongs_to :usuario
	enum tipo: [ :de_usuarios, :de_ganancias ]
	enum tipodeusuarios: [ :mas_gauchadas_resueltas, :mas_gauchadas_pedidas , :mas_puntos]

end
