class CreateDisciplinesRepositoryThemes < ActiveRecord::Migration
  def change
    create_table :disciplines_repository_themes, :id => false do |t|
      t.integer :discipline_id
      t.integer :repository_theme_id
    end
  end
end
