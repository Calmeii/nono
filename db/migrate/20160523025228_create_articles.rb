class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :watch
      t.boolean :public

      t.timestamps null: false
    end
  end
end
