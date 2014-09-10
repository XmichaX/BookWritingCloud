class Chapter < ActiveRecord::Base

	attr_accessible :title, :chapter_number, :description, :book_id, :original_updated_at

	belongs_to :book, inverse_of: :chapters
	has_many :chunks, :as => :chunkable


	validates_presence_of :title, :book_id
	validates :title, :uniqueness => {:scope => :book_id}

	def username
		user.email
	end

	def has_chunks?
		!chunks.empty?
	end

	def max_chunk_position
		has_chunks? ? chunks.max_by(&:position).position : 0
	end
end