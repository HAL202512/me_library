class CreateReflectionTags < ActiveRecord::Migration[8.1]
  def change
    create_table :reflection_tags do |t|
      t.references :reflection, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
