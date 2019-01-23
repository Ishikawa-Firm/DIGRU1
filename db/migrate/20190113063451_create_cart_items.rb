class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
        t.integer  	:product_id
		t.integer   :cart_id
		t.integer  	:price
		t.integer   :quantity
		t.integer  :status, default: 0, null: false, limit: 1
        t.timestamps
    end
  end
end
