class CreateDiscNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :disc_numbers do |t|

    	t.integer  :product_id
		t.text     :disc_name
     	t.timestamps
    end
  end
end
