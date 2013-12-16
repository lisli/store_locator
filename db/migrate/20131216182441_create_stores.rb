class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :state_abbr
      t.string :zip
      t.string :country

      t.timestamps
    end
  end
end
