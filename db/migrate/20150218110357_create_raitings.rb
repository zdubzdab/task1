class CreateRaitings < ActiveRecord::Migration
  def change
    create_table :raitings do |t|
      t.integer :value
      t.belongs_to :article, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
