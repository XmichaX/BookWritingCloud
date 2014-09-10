class Book < ActiveRecord::Base

	attr_accessible :title, :edition, :published, :genre, :abstract, :tags, :user_ids, :closed

	validates_presence_of :title, :edition
	validates :edition, :uniqueness => {:scope => :title}

	before_destroy :destroy_chunks

	has_and_belongs_to_many :users
	has_many :chapters, inverse_of: :book
	has_many :chunks, :as => :chunkable

	def sliced_attributes
		attributes.slice('title', 'genre', 'abstract', 'tags')
	end

	def published?
		!published.nil?
	end

	def has_chunks?
		!chunks.empty?
	end

	def has_chapters?
		!chapters.empty?
	end

	def max_chunk_position
		has_chunks? ? chunks.max_by(&:position).position : 0
	end

	def users_list
		users.collect { |u| u.username }.join(',')
	end

	def users_list_real_names
		users.collect { |u| u.first_name + ' ' + u.last_name }.join(',')
	end

	private
	def destroy_chunks
		chunks.each do |chunk|
			chunk.destroy
		end
	end

end

