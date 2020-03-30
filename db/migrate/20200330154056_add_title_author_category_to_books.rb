class AddTitleAuthorCategoryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :category, :string
  end
end
