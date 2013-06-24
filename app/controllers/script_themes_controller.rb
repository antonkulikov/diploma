class ScriptThemesController < ApplicationController

  def index
    @script_themes = ScriptTheme.all
  end


  def show
    @script_theme = ScriptTheme.find(params[:id])
  end


  def new
    @script_theme = ScriptTheme.new
  end


  def edit
    @script_theme = ScriptTheme.find(params[:id])
  end


  def create
    @script_theme = ScriptTheme.new(params[:script_theme])

    respond_to do |format|
      if @script_theme.save
        format.html { redirect_to @script_theme, :notice => 'Script theme was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @script_theme = ScriptTheme.find(params[:id])

    respond_to do |format|
      if @script_theme.update_attributes(params[:script_theme])
        format.html { redirect_to @script_theme, :notice => 'Script theme was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @script_theme = ScriptTheme.find(params[:id])
    @script_theme.destroy

    respond_to do |format|
      format.html { redirect_to script_themes_url }
    end
  end
end
