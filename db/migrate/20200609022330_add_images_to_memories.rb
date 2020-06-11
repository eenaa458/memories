class AddImagesToMemories < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :images, :string
  end
end
