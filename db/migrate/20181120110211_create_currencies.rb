class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :iso_code, limit: 3

      t.timestamps
    end
  end
end
