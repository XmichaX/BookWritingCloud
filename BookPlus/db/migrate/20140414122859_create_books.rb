class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :user
      t.string :title
      t.text :chunk

      t.timestamps
    end
  end
end
