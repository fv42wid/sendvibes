class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.integer :user_id
      t.integer :chargeable_id
      t.string :chargeable_type
      t.string :description
      t.integer :amount
      t.string :currency
      t.string :stripe_charge_id
      t.string :card_last_4
      t.string :card_exp_month
      t.string :card_exp_year
      t.string :card_type

      t.timestamps
    end
  end
end
