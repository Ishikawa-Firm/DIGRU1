class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

		t.integer  :artist_id
		t.string   :name
		t.integer  :price
		t.string   :label
		t.integer  :genre, default: 0, null: false, limit: 1
		t.integer  :stock, null: false
		t.string   :image_id
		t.text     :movie_url
		t.boolean  :deleted_at
        t.timestamps
    end
  end
end
