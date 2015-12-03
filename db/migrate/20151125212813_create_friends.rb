class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :gender
      t.date :birthday

      t.timestamps null: false
    end
  end
end
