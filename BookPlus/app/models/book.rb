class Book < ActiveRecord::Base
  attr_accessible :title, :user_ids
  has_and_belongs_to_many :users
  has_many :chunks

  before_destroy :destroy_chunks

  def has_chunks?
    !chunks.empty?
  end

  def destroy_chunks
    chunks.each do |chunk|
      chunk.destroy
    end
  end
end
