class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

		t.integer  :user_id
		t.string   :name
		t.integer  :price
		t.string   :label
		t.integer  :genre
		t.integer  :stock
		t.string   :image_id
		t.text     :movie_url
		t.boolean  :delete_at
        t.timestamps
    end
  end
end
