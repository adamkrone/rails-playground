class PageBlock < ActiveRecord::Base
  belongs_to :page
  belongs_to :block

  default_scope { order(priority: :asc) }

  def self.add_page_block(block, page, column, priority)
    self.create(block_id: block.id, page_id: page.id, column: column, priority: priority)
  end

  def update_priority(new_priority)
    page_blocks = PageBlock.where(page_id: page_id, column: column).to_a
    page_blocks.insert(new_priority - 1, page_blocks.delete_at(priority - 1))

    page_blocks.each_with_index do |pb, i|
      pb.priority = i + 1;
      pb.save
    end
  end
end
