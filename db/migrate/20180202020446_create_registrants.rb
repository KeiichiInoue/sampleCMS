class CreateRegistrants < ActiveRecord::Migration[5.1]
  def change
    create_table :registrants do |t|
      t.string :code
      t.string :name
      t.string :device_info
      t.string :device_type

      t.timestamps
    end
  end
end
