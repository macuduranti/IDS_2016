class Comentario < ActiveRecord::Base
	default_scope -> { order("created_at asc") }
	belongs_to :favor
end
