class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.date :date_purchased
      t.references :friend, index: true

      t.timestamps null: false
    end
  end
end
