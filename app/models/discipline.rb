class Discipline < ActiveRecord::Base
  attr_accessible :name, :repository_themes

  has_and_belongs_to_many :repository_themes
  has_many :blocks
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope order(:name)
  
  attr_reader :repository_theme_tokens
  
  def repository_theme_tokens=(ids)
    self.repository_theme_ids = ids.split(",")
  end
  
  def self.search(search)
    if search
      where('lower(name) LIKE lower(?)', "%#{search}%")
    else
      scoped
    end
  end

end
