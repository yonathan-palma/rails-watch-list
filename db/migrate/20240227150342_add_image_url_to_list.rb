class AddImageUrlToList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :imageUrl, :string
  end
end
