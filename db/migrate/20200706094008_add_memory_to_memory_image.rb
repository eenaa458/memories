class AddMemoryToMemoryImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :memory_images, :memory, foreign_key: true
  end
end
