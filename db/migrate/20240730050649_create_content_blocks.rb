class CreateContentBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :content_blocks do |t|
      t.references :cv, null: false, foreign_key: true
      t.integer :position
      t.references :content, polymorphic: true

      t.timestamps
    end
  end
end
