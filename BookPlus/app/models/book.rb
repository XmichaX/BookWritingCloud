class Book < ActiveRecord::Base
  attr_accessible :chunk, :title, :user
  validates :user, :presence => true
  validates :title, :presence => true
end
