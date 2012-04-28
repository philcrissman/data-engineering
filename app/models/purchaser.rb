class Purchaser < ActiveRecord::Base
  attr_accessible :name

  has_many :line_items
  has_many :items, :through => :line_items
end
