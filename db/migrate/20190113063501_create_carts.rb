class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    	t.integer  :user_id
		t.integer  :total_price
		t.string   :other_name
		t.string   :other_postal_code
		t.string   :other_adress
		t.string   :status
		t.datetime :added_at
        t.timestamps
    end
  end
end
