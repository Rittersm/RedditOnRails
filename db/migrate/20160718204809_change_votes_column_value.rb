class ChangeVotesColumnValue < ActiveRecord::Migration
  def change
    change_column :links, :votes, :integer, :default => 1
  end
end
