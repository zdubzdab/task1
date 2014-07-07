class CreateArticlesAndTags < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.timestamps
    end
 
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end
 
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end