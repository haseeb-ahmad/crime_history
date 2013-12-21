class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :name
      t.references :crime_type

      t.timestamps
    end
    add_index :crimes, :crime_type_id
  end
end
