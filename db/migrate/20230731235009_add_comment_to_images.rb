class AddCommentToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :comment, :text
  end
end
