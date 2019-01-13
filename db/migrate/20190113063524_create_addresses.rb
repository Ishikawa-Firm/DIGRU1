class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.integer   :user_id
		t.string    :other_name
		t.string    :other_postal_code
		t.string    :other_address
        t.timestamps
    end
  end
end
