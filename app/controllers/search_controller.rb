class SearchController < ApplicationController
  def index
    if params[:search].nil?
      @examines = Examine.all
      @scripts = Script.all
    else
      @examines = Examine.where('LOWER(name) LIKE LOWER(?)', "%#{params[:search]}%")
      @scripts = Script.where('LOWER(name) LIKE LOWER(?)', "%#{params[:search]}%")
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

end
