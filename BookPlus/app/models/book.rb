class Book < ActiveRecord::Base
  attr_accessible :chunk, :title, :user
  has_many :users
  validates :title, :presence => true
  validates :user, :presence => true
end
