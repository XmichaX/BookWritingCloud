class CreateBooksUsers < ActiveRecord::Migration
  def change
    create_table :books_users do |t|
      t.belongs_to :book
      t.belongs_to :user
    end
  end
end
