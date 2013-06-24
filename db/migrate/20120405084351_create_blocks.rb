class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :discipline_id
      t.string :year
      t.integer :block_num

      t.timestamps
    end
  end
end
