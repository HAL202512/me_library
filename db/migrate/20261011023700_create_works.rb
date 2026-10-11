class CreateWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :works do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.string :genre, null: false

      t.timestamps
    end
  end
end