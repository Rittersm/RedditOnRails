class LinksMigration < ActiveRecord::Migration
  def change

    add_column :links, :title, :string
    add_column :links, :user_id, :integer
    add_column :links, :link, :string
    add_column :links, :thumbnail, :string
    add_column :links, :votes, :integer

  end
end
