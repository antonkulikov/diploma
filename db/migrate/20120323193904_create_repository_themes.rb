class CreateRepositoryThemes < ActiveRecord::Migration
  def change
    create_table :repository_themes do |t|
      t.string :name
      t.string :path
      t.integer :count

      t.timestamps
    end
  end
end
