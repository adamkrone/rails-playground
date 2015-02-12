class Page < ActiveRecord::Base
  belongs_to :layout
  has_many :page_blocks
  has_many :blocks, through: :page_blocks

  def blocks_for_column(column)
    page_blocks.where(column: column)
               .order(priority: :asc)
               .map { |pb| Block.find(pb.block_id) }
  end

  def add_block_to_column(block, column, priority = nil)
    return false unless layout.has_column?(column)

    priority ||= blocks_for_column(column).count + 1
    PageBlock.add_block_to_page(block, self, column, priority)
  end

  def update_block_priority(block, priority)
    page_block = page_blocks.find_by(block_id: block.id)
    page_block.update_priority(priority)
  end
end
