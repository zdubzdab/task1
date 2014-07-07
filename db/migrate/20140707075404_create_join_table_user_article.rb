class CreateJoinTableUserArticle < ActiveRecord::Migration
  def change
    create_join_table :users, :articles do |t|
      t.index :user_id
      t.index :article_id 
    end
  end
end
