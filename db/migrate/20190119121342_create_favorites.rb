class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false #外部キー
      t.references :product, null:false #外部キー
      t.timestamps
    end

    add_index :favorites, :user #インデックス
    add_index :favorites, :product #インデックス
  end
end
