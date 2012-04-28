require 'spec_helper'

include ActionDispatch::TestProcess

describe Order do

  it "should parse a file after uploading it" do
    @order = Order.new(:file => fixture_file_upload('/example_input.tab'))

    @order.should_receive(:parse!)

    @order.save
  end
  
  context "parsing the attached file" do

    before do
      @order = Order.new(:file => fixture_file_upload('/example_input.tab'))
      @order.save
    end

    it "should save various objects for each line" do
      Purchaser.count.should == 3
      Item.count.should == 3
      LineItem.count.should == 4
      Merchant.count.should == 3
    end

    it "should only save new line_items, not new purchaser, item, or merchants, if we reupload the same file" do
      new_order = Order.new(:file => fixture_file_upload('/example_input.tab'))
      new_order.save

      Purchaser.count.should == 3
      Item.count.should == 3
      LineItem.count.should == 8
      Merchant.count.should == 3
    end

  end

  it "should be able to calculate a total" do
    order = Order.new(:file => fixture_file_upload('/example_input.tab'))
    order.save

    order.total.should == 95.0
  end

end
