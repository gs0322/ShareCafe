class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string 'title'
      t.text 'text'
      t.string 'img'
      t.integer 'user_id'
      t.timestamps null: true
    end
  end
end
