class CreateArticlesAndTags < ActiveRecord::Migration
  def change
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end