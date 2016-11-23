class Favor < ActiveRecord::Base
	belongs_to :usuario

	default_scope -> { order("created_at desc") }
	scope :titulo, -> (titulo) { where("lower(titulo) like ?", "%#{titulo.downcase}%")}

	#scope :dueño, -> (joins(:usuario_id).merge(Usuario.nombre)) { where("lower(joins(:usuario_id).merge(Usuario.nombre)) like ?", "%#{dueño.downcase}%")}
	#scope :status, -> (status) { where status: status }
  	scope :ubicacion, -> (ubicacion) { where ubicacion: ubicacion}


	has_many :postulacions, dependent: :destroy
	has_many :comentarios, dependent: :destroy

end
