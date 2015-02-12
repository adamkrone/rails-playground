class AddColumnToPageBlocks < ActiveRecord::Migration
  def change
    add_column :page_blocks, :column, :integer
  end
end
