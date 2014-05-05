class Book < ActiveRecord::Base
  attr_accessible :title, :user_ids
  has_and_belongs_to_many :users
end
