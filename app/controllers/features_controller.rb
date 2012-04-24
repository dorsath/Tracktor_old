class FeaturesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @feature = @project.features.new
  end

  def create
    @project = Project.find(params[:project_id])
    @feature = @project.features.create!(params[:feature])
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @feature = @project.features.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    @feature.update_attributes(params[:feature])
    redirect_to project_path(@project)
  end
end
