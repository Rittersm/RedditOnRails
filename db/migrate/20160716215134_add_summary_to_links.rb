class AddSummaryToLinks < ActiveRecord::Migration
  def change
    add_column :links, :summary, :string
  end
end
