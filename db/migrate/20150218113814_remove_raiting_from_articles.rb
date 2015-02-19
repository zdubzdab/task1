class RemoveRaitingFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :raiting, :integer
  end
end
