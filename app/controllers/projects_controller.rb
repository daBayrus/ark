class ProjectsController < ApplicationController

  def index
    # FIXME: paginate
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end
