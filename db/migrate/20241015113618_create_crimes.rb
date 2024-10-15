class CreateCrimes < ActiveRecord::Migration[7.2]
  def change
    create_table :crimes do |t|
      t.string :category
      t.float :longitude
      t.float :latitude
      t.date :date

      t.timestamps
    end
  end
end
