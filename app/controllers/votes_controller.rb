class VotesController < ApplicationController

  include ActionView::RecordIdentifier

  before_action :set_vote, only: [ :create ]
  def create
    @project.increment! :vote
    respond_to do |format|
      format.turbo_stream { render 'projects/result', locals: { project: @project } }
      format.html { redirect_to projects_path }
    end
  end

  private

  def set_vote
    @project = Project.find(params[:project_id])
  end
end
