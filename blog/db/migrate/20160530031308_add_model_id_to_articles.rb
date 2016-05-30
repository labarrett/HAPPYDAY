class AddModelIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :model_id, :integer
    add_index :articles, :model_id
  end
end
