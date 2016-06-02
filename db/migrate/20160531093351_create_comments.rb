class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :content
      t.integer :zan

      t.timestamps null: false
    end
  end
end
