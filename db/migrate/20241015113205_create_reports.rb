class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.references :hotel, null: false, foreign_key: true
      t.text :comment
      t.float :safety_rating

      t.timestamps
    end
  end
end
