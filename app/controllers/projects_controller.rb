class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    Project.create!(params[:project])
    redirect_to projects_path
  end

  def add_user
    @project = Project.find(params[:id])
    @users = User.all
  end

  def adds_user
    @project = Project.find(params[:id])
    @project.users << User.find(params[:project][:users])
    redirect_to projects_path
  end

  def users
    @project = Project.find(params[:id])
  end

  def removes_user_from
    project = Project.find(params[:id])
    project.remove_user(User.find(params[:user_id]))
    redirect_to users_project_path(project)
  end
end
