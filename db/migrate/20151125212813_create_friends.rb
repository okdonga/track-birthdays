class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps null: false
    end
  end
end
