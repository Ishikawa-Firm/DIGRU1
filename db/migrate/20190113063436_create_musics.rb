class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|

    	t.integer :disc_number_id
    	t.text    :name
    	t.integer :truck_number
        t.timestamps
    end
  end
end
