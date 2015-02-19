class AddRaitingToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :raiting, :integer
  end
end
