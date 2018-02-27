class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :type_code
      t.string :type_val
      t.string :type_name
      t.string :type_info

      t.timestamps
    end
  end
end
