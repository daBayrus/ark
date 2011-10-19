class PledgesController < ApplicationController
  before_filter :authenticate_user!, :load_project

  def new
    @pledge  = @project.pledges.new
  end

  def create 
    @pledge      = @project.pledges.build params[:pledge]
    @pledge.user = current_user
    @pledge.save!

    redirect_to @project
  end

  protected

  def load_project
    @project = Project.find(params[:project_id])
  end

end
