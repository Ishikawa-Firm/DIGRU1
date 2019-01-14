class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer  :user_id
		t.integer  :sum_price
		t.string   :other_name
		t.string   :other_postal_code
		t.string   :other_adress
		t.string   :status
		t.datetime :created_at
        t.timestamps
    end
  end
end
