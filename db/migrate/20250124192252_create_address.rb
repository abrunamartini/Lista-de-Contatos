class CreateAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :UF
      t.string :city
      t.string :country
      t.string :zip
      t.string :street
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end
end
