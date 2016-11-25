class Favor < ActiveRecord::Base
	belongs_to :usuario

	default_scope -> { order("created_at desc") }
	scope :titulo, -> (titulo) { where("lower(titulo) like ?", "%#{titulo.downcase}%")}
	#scope :resuelta, -> (resuelta) { where :resuelta resuelta }
	scope :dueno, -> () { joins(:usuario).where('usuario.nombre like ?',"%#{dueno.downcase}")}
	#scope :dueno, lambda {|u| where (usuario.nombre => u)}

	#scope :status, -> (status) { where status: status }
  	scope :ubicacion, -> (ubicacion) { where ubicacion: ubicacion }


	has_many :postulacions, dependent: :destroy
	has_many :comentarios, dependent: :destroy

	def tiene_elegido?
		postus = self.postulacions
		postus.each do |p|
			if p.elegido
				return true
			end
		end
		return false
	end

	def get_elegido
		p = self.postulacions.where(elegido: true)
		p.each do |pp|
			if pp.favor_id == self.id
				return pp.usuario_id
			end
			return 0
		end
	end
end
