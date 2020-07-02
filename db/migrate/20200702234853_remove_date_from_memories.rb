class RemoveDateFromMemories < ActiveRecord::Migration[5.2]
  def change
    remove_column :memories, :date, :string
  end
end
