class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

      create_table :articles do |t|
        t.belongs_to :user
        t.string :title
        t.text :text
        t.timestamps
    end
  end
end
 