class Block < ActiveRecord::Base
  has_many :page_blocks
  has_many :pages, through: :page_blocks
end
