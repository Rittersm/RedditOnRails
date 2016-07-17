class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.integer :user_id
      t.string :link
      t.string :thumbnail
      t.integer :votes
      t.string :summary
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
