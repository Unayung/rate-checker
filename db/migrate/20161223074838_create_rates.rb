class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :currency_id
      t.string :current_rate

      t.timestamps
    end
  end
end
