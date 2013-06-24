# -*- coding: utf-8 -*-
class Examine < ActiveRecord::Base
  attr_accessible :name, :necessary, :blocked, :num_try, :periodm, :test_type, :w_key, :ext_access, :msiu_access, :ordinal, :scheduled_date, :scheduled_pair

  default_scope order(:ordinal, :scheduled_date)

  #before_create :assign_ordinal 

  has_and_belongs_to_many :blocks
  
  has_many :scripts, :dependent => :destroy
  accepts_nested_attributes_for :scripts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_presence_of :name, :num_try, :period, :test_type
  validates :num_try, :numericality=>{:only_integer=>true},:allow_blank=>false
  validates :period, :numericality=>{:only_integer=>true},:allow_blank=>false
  
  EXAMINE_TYPES = ['для слушателей подготовительного факультета',
                   'для учащихся подшефных школ',
                   'для самостоятельного тестирования студентов',
                   'промежуточные тесты контроля знаний для студентов',
                   'экзаменационные тесты для студентов']

  RESULTS = ['Результат по вопросам', 'Результат по темам', 'Детальный результат']
  
  def to_xml(options={})
    super(:except => [:id, :created_at, :updated_at, :ordinal, :examine_id, :base_script_id, :script_id, :script_theme_id], :include => {:scripts => {:include => {:script_themes => {:include => :script_sub_themes}}}})
  end
  
  private
  
  def assign_ordinal
    num = Examine.maximum('ordinal')
    if num.nil?
      self.ordinal = 1
    else
      self.ordinal = num + 1
    end
  end
end
