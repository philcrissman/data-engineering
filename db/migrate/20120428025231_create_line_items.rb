class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id, :quantity, :order_id, :purchaser_id

      t.timestamps
    end
  end
end
