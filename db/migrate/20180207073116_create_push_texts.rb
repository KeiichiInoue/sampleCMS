class CreatePushTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :push_texts do |t|
      t.references :registrant, foreign_key: true
      t.string :detail
      t.datetime :pushed_at
      t.string :code

      t.timestamps
    end
  end
end
