class AddViewsToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :views, :integer
  end
end
