class ScriptSubTheme < ActiveRecord::Base
  attr_accessible :name, :start_num, :end_num, :questions_to_pass, :questions_count, :order_questions, :script_theme_id

  default_scope order(:name)

  belongs_to :script_theme
  
  validates_presence_of :name, :start_num, :end_num, :questions_to_pass, :questions_count
end
