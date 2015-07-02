class CreateArticles < ActiveRecord::Migration 
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :title
      t.text :text
      t.timestamps
    end
    change_table :articles do |t|
      t.belongs_to :tag
    end
  end
end
