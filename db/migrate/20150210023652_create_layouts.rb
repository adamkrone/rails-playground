class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :name
      t.integer :columns

      t.timestamps null: false
    end
  end
end
