class AddUserToReports < ActiveRecord::Migration[7.2]
  def change
    add_reference :reports, :user, null: false, foreign_key: true
  end
end
