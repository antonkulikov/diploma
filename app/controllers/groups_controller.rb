# -*- coding: utf-8 -*-
class GroupsController < ApplicationController

  def index
    if params[:name]
      used_groups = {} || Group.includes(:blocks).where('blocks.discipline_id = ?', params[:discipline_id])
      # @groups = Group.where("name LIKE ? AND id NOT IN (?)", "%#{params[:name]}%", used_groups)
      @groups = Group.where("name LIKE ?", "%#{params[:name]}%")
    else
      @groups = Group.order(:name)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @groups.map(&:attributes) }
    end
  end


  def show
    @group = Group.find(params[:id])
  end


  def new
    @group = Group.new
  end


  def edit
    @group = Group.find(params[:id])
  end


  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, :notice => 'Новая группа создана.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Группа отредактирована.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
    end
  end
end

