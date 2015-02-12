class CreatePageBlocks < ActiveRecord::Migration
  def change
    create_table :page_blocks do |t|
      t.integer :page_id
      t.integer :block_id
      t.integer :priority

      t.timestamps null: false
    end
  end
end
