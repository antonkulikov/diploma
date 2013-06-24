class RepositoryTheme < ActiveRecord::Base
  attr_accessible :name, :path, :count

  has_and_belongs_to_many :disciplines
  has_many :script_themes
  
  validates_presence_of :name, :path, :count
end
