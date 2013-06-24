class CreateBlocksGroups < ActiveRecord::Migration
  def change
    create_table :blocks_groups, :id => false do |t|
      t.integer :block_id
      t.integer :group_id
    end
  end
end
