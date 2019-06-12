class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.integer :sub_id
      t.string :title
      t.string :url
      t.string :content
      t.timestamps
    end
  end
end
