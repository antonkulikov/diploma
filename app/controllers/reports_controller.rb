class ReportsController < ApplicationController
  def index
    @disciplines = Discipline.joins(:blocks => :examines).uniq
    @groups = Group.joins(:blocks => :examines).uniq
  end
  
  def show
    @students = Student.order(:lastname)
    if params[:discipline_id]
	  @discipline = Discipline.joins(:blocks => [:groups, :examines]).find(params[:discipline_id])
    elsif params[:group_id]
      @group = Group.joins(:blocks => [:discipline, :examines]).find(params[:group_id])
    end
    respond_to do |format|
      format.html
      format.js {render :nothing => true}
    end
  end
end
