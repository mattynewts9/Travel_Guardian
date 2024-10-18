class AddAdressToCrimes < ActiveRecord::Migration[7.2]
  def change
    add_column :crimes, :address, :string
  end
end
