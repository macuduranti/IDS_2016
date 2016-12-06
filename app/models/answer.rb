class Answer < ActiveRecord::Base
	default_scope -> { order("created_at asc") }
	belongs_to :comentario
	belongs_to :usuario
end
