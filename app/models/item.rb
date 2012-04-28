class Item < ActiveRecord::Base
  attr_accessible :description, :price_in_cents, :merchant_id

  belongs_to :merchant
  has_many :line_items
  has_many :orders, :through => :line_items

  def price
    price_in_cents.to_f / 100
  end

end
