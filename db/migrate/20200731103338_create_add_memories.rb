class CreateAddMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :add_memories do |t|
      t.references :user, foreign_key: true
      t.references :memory, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :memory_id], unique: true
    end
  end
end
