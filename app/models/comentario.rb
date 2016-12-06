class Comentario < ActiveRecord::Base
	default_scope -> { order("created_at asc") }
	belongs_to :favor
	has_many :answers, dependent: :destroy
end
