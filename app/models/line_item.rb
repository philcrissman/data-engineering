class LineItem < ActiveRecord::Base
  attr_accessible :item_id, :item, :quantity, :order_id, :order, :purchaser_id, :purchaser

  belongs_to :item
  belongs_to :order
  belongs_to :purchaser
end
