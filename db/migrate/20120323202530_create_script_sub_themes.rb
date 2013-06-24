class CreateScriptSubThemes < ActiveRecord::Migration
  def change
    create_table :script_sub_themes do |t|
      t.string :name
      t.integer :start_num
      t.integer :end_num
      t.integer :questions_to_pass
      t.integer :questions_count
      t.boolean :order_questions
      t.integer :script_theme_id

      t.timestamps
    end
  end
end
