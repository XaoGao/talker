class AddCountryAndCityToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :country, :string, default: '', null: false
    add_column :users, :city, :string, default: '', null: false
  end
end
