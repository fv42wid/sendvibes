class CreateSponsor < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.integer :cause_id
      t.integer :charge_id
    end
  end
end
