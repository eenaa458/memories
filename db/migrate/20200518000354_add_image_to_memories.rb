class AddImageToMemories < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :image, :string
  end
end
