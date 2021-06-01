class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.integer :USD, defualt: 0, null: false
      t.integer :EUR, default: 0, null: false
      t.boolean :last, default: true, null: false
      t.timestamps
    end
  end
end
