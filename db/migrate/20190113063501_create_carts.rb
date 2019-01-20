class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    t.integer  :user_id
    t.integer  :address_id
		t.integer  :total_price
		t.integer  :status, default: 0, null: false, limit: 1
		t.datetime :added_at
        t.timestamps
    end
  end
end

