class AddDismissToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :dismiss, :boolean, default: false
  end
end

