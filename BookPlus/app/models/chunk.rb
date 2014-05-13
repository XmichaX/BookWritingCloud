class Chunk < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  attr_accessible :content, :section, :title, :user_id

  def username
    user.email
  end
end
