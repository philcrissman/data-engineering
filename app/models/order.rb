class Order < ActiveRecord::Base

  mount_uploader :file, FileUploader

  attr_accessible :file

  after_create :parse!

  has_many :line_items

  def total
    line_items.inject(0){|sum, line_item| sum + (line_item.item.price * line_item.quantity)} 
  end
  


  private

  def parse!
    string = File.read(file.file.file)
    lines = string.split("\n")
    lines[1..-1].each do |line|
      values = line.split("\t")
      # save the various values to the corresponding objects. 
      # link them back to this order, via order_id
      # We don't want duplicate purchasers, items, or merchants, so we need to check if they exist first.
      @purchaser = Purchaser.find_or_create_by_name(values[0])
      @merchant = Merchant.find_or_create_by_name_and_address(values[5], values[4])
      price_in_cents = (values[2].to_f*100).to_i
      @item = @merchant.items.find_or_create_by_description_and_price_in_cents(values[1], price_in_cents)
      #
      @line_item = LineItem.create(order: self, quantity: values[3], item: @item, purchaser: @purchaser)
    end
  end
end
