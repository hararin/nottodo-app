class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :content, null: false, default: ""
      t.text :detail, null: false, default: ""
      t.date :period, null: true
      t.boolean :isFinished, null: false, default: false
      t.integer :patience, null: false, default: 0

      t.timestamps
    end
  end
end
