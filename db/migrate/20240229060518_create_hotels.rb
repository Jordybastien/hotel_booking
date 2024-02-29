class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name, unique: true, null: false
      t.string :city, null: false
      t.timestamps
    end

    add_index :hotels, :city
  end
end
