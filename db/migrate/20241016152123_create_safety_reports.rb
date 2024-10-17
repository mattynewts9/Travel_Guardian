class CreateSafetyReports < ActiveRecord::Migration[7.2]
  def change
    create_table :safety_reports do |t|
      t.string :title
      t.text :description
      t.string :hotel_name
      t.date :report_date

      t.timestamps
    end
  end
end
