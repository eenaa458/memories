class CreateMemoryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
