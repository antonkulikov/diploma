# -*- coding: utf-8 -*-
class BlocksController < ApplicationController

  def index
    if params[:block_id]
      @block = Block.includes(:examines => :scripts).find(params[:block_id])
    elsif params[:discipline_id]
      @blocks = Block.includes(:groups, :examines => :scripts).where('discipline_id = ?', params[:discipline_id])
      @discipline = Discipline.find(params[:discipline_id])
    else
      @groups = Group.joins(:blocks => :discipline).uniq
      @blocks = Block.includes(:discipline, :groups, :examines => :scripts).all
      @block_disciplines = @blocks.group_by { |b| b.discipline.name }
    end
    @examine = Examine.new
    respond_to do |format|
       format.html
       format.js
    end
  end


  def show
    @block = Block.find(params[:id])
  end


  def new
    @block = Block.new
    @block.year = current_study_year
    @block.discipline_id = params[:discipline_id] unless params[:discipline_id].blank?
  end


  def edit
    @block = Block.find(params[:id])
  end


  def create
    @block = Block.new(params[:block])

    if @block.save
      redirect_to blocks_url(:discipline_id => @block.discipline_id), :notice => 'Новый блок создан.'
    else
      render :action => "new"
    end
  end


  def update
    @block = Block.find(params[:id])

    if @block.update_attributes(params[:block])
      redirect_to @block, :notice => 'Блок отредактирован.'
    else
      render :action => "edit"
    end
  end


  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    redirect_to blocks_url(:discipline_id => @block.discipline_id)
  end
  
  def year
    respond_to do |format|
      format.json { render :json => select_year }
    end
  end

  def add_groups
    block = Block.find(params[:id])
    block.group_ids = params[:group_ids]
    redirect_to blocks_url(:discipline_id => block.discipline_id)
  end
  
  def add_examines
    block = Block.find(params[:id])
    examines_ids = []
    params[:examine_ids] = {} || params[:examine_ids]
     for e_id in params[:examine_ids]
       unless block.examine_ids.include?(e_id.to_i)
         examines_ids << e_id
       end
     end
    for e_id in examines_ids
      e = Examine.find(e_id).dup
      e.name += "(копия для #{block.discipline.name})"
      e.save
      block.examines << e
    end
    redirect_to blocks_url(:discipline_id => block.discipline_id)
  end
end

