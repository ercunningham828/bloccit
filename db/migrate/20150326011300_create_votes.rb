class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :posts
  end
end
