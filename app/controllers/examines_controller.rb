# -*- coding: utf-8 -*-
class ExaminesController < ApplicationController

  def index
    if params[:repository_theme_id]
      @repository_theme = RepositoryTheme.find(params[:repository_theme_id])
      @examines = Examine.includes(:scripts => [:script_themes => :repository_theme]).where('repository_themes.id = ?', params[:repository_theme_id])
    elsif params[:group_id]
      @group = Group.unscoped.find(params[:group_id])
      @disciplines = Discipline.unscoped.includes(:blocks => :groups).where(:blocks => {:groups => {:id => @group.id}})
    else
      @examines = Examine.all
    end
  end


  def show
    @examine = Examine.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @examine}
    end
  end

  def new
    @examine = Examine.new
  end


  def edit
    @examine = Examine.find(params[:id])
  end


  def create
    @examine = Examine.new(params[:examine])
    params[:block] = @examine.block_ids
    block = @examine.blocks.first

      if @examine.save
        redirect_to blocks_url(:discipline_id => block.discipline_id), :notice => 'Новый тест создан.'
      else
        render :action => "new"
      end
  end


  def update
    @examine = Examine.find(params[:id])
    block = @examine.blocks.first

      if @examine.update_attributes(params[:examine])
        redirect_to blocks_url(:discipline_id => block.discipline_id), :notice => 'Тест отредактирован.'
      else
        render :action => "edit"
      end
  end


  def destroy
    @examine = Examine.find(params[:id])
    @examine.destroy

    redirect_to examines_url
  end
  
  
  def sort
    params[:examine].each_with_index do |id, index|
      Examine.update_all(['ordinal=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
