class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
