class Layout < ActiveRecord::Base
  has_many :pages

  def has_column?(column)
    return true if column <= columns
    false
  end
end
