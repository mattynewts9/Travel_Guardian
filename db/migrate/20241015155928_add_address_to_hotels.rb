class AddAddressToHotels < ActiveRecord::Migration[7.2]
  def change
    add_column :hotels, :address, :string
  end
end
