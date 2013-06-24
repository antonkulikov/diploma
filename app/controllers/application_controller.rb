class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_study_year
    current_year = Time.now.year.to_i
    current_month = Time.now.month.to_i
    if current_month < 9
      (current_year-1).to_s + "/" + current_year.to_s
    else
      current_year.to_s + "/" + (current_year+1).to_s
    end
  end
  
  def select_year
    current_study_year_start, current_study_year_end = current_study_year.split('/').map{|s| s.to_i}
    res = []
    for i in -2..2
      res << "#{current_study_year_start+i}/#{current_study_year_end+i}"
    end
    res
  end
end
