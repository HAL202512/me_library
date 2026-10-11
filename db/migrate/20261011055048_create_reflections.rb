class CreateReflections < ActiveRecord::Migration[8.1]
  def change
    create_table :reflections do |t|
      t.references :memory, null: false, foreign_key: true
      t.date :recorded_on, null: false
      t.text :content

      t.timestamps
    end
  end
end