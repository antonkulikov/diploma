class Script < ActiveRecord::Base
  attr_accessible :name, :redirect_page, :time, :blocked, :order_themes, :questions_to_pass, :themes_to_pass, :results, :examine_id, :base_script_id

  #default_scope order(:name)

  belongs_to :examine
  has_many :script_themes, :dependent => :destroy
  accepts_nested_attributes_for :script_themes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :redirect_page, :time
  validates :questions_to_pass, :presence => true, :if => "themes_to_pass.nil?"
  validates :themes_to_pass, :presence => true, :if => "questions_to_pass.nil?"
end
