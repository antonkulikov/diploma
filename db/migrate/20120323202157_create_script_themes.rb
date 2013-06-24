class CreateScriptThemes < ActiveRecord::Migration
  def change
    create_table :script_themes do |t|
      t.string :name
      t.integer :repository_theme_id
      t.integer :questions_to_pass
      t.integer :subthemes_to_pass
      t.boolean :order_subthemes
      t.integer :script_id

      t.timestamps
    end
  end
end
