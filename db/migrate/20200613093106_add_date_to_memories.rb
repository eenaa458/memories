class AddDateToMemories < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :date, :date
  end
end
