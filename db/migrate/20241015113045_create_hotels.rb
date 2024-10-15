class CreateHotels < ActiveRecord::Migration[7.2]
  def change
    create_table :hotels do |t|
      t.references :user, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.float :crime_rating
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
