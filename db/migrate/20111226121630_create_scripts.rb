class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.string :redirect_page
      t.integer :time
      t.boolean :blocked
      t.boolean :order_themes
      t.integer :questions_to_pass
      t.integer :themes_to_pass
      t.integer :results
      t.integer :examine_id
      t.integer :base_script_id

      t.timestamps
    end
  end
end
