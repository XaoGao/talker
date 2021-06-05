class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.string :USD, defualt: '', null: false
      t.string :EUR, default: '', null: false
      t.boolean :current, default: true, null: false
      t.timestamps
    end
  end
end
