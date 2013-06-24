# -*- coding: utf-8 -*-
class ScriptsController < ApplicationController

  def index
    @scripts = Script.includes(:examine).all
  end

  def show
    @script = Script.includes(:examine).find(params[:id])
  end

  def new
    @script = Script.new
  end

  def edit
    @script = Script.find(params[:id])
  end

  def create
    @script = Script.new(params[:script])
    
    params[:examine].each do |key, value|
      @script.examine_id = key
    end

    respond_to do |format|
      if @script.save
        format.html { redirect_to @script, :notice => 'Новый сценарий создан.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to @script, :notice => 'Сценарий отредактирован.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @script.destroy

    respond_to do |format|
      format.html { redirect_to scripts_url }
    end
  end
end

