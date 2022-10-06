class RemoveTitleFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :title, :string
  end
end
