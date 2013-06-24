class ScriptSubThemesController < ApplicationController

  def index
    @script_sub_themes = ScriptSubTheme.all
  end


  def show
    @script_sub_theme = ScriptSubTheme.find(params[:id])
  end


  def new
    @script_sub_theme = ScriptSubTheme.new
  end


  def edit
    @script_sub_theme = ScriptSubTheme.find(params[:id])
  end


  def create
    @script_sub_theme = ScriptSubTheme.new(params[:script_sub_theme])

    respond_to do |format|
      if @script_sub_theme.save
        format.html { redirect_to @script_sub_theme, :notice => 'Script sub theme was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @script_sub_theme = ScriptSubTheme.find(params[:id])

    respond_to do |format|
      if @script_sub_theme.update_attributes(params[:script_sub_theme])
        format.html { redirect_to @script_sub_theme, :notice => 'Script sub theme was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @script_sub_theme = ScriptSubTheme.find(params[:id])
    @script_sub_theme.destroy

    respond_to do |format|
      format.html { redirect_to script_sub_themes_url }
    end
  end
end
