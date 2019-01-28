class AddIntroductionToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :introduction, :text
  end
end
