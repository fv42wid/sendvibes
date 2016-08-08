class CreateVibes < ActiveRecord::Migration[5.0]
  def change
    create_table :vibes do |t|
      t.integer :user_id
      t.integer :cause_id

      t.timestamps
    end
  end
end
