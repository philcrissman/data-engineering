class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :merchant_id, :price_in_cents
      t.string :description

      t.timestamps
    end
  end
end
