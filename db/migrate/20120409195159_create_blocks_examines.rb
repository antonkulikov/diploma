class CreateBlocksExamines < ActiveRecord::Migration
  def change
    create_table :blocks_examines, :id => false do |t|
    t.integer :block_id
    t.integer :examine_id
    end
  end
end
