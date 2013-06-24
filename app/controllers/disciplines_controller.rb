# -*- coding: utf-8 -*-
class DisciplinesController < ApplicationController

  def index
    if params[:term]
      @disciplines = Discipline.where("lower(name) LIKE lower(?)","%#{params[:term]}%")
    elsif params[:name]
      @disciplines = Discipline.where("lower(name) LIKE lower(?)","%#{params[:name]}%")
    elsif params[:repository_theme_id]
      @disciplines = Discipline.includes(:repository_themes, :blocks => :examines).search(params[:search]).where(:repository_themes => {:id => params[:repository_theme_id]})
    else
      @disciplines = Discipline.includes(:repository_themes, :blocks => :examines).search(params[:search])
    end

    respond_to do |format|
      format.html
      format.js
      format.json do
        render :json => @disciplines.map(&:attributes)  if params[:name]
        render :json => @disciplines.map(&:name)  if params[:term]
      end
    end
  end


  def show
    @discipline = Discipline.find(params[:id])
  end


  def new
    @discipline = Discipline.new
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end


  def create
    @discipline = Discipline.new(params[:discipline])

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to disciplines_url, :notice => 'Новая дисциплина создана.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to disciplines_url, :notice => 'Дисциплина отредактирована.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
    end
  end
end
