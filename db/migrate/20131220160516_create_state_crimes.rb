class CreateStateCrimes < ActiveRecord::Migration
  def change
    create_table :state_crimes do |t|
      t.integer :year
      t.integer :count
      t.references :crime
      t.references :state

      t.timestamps
    end
    add_index :state_crimes, :crime_id
    add_index :state_crimes, :state_id
  end
end
