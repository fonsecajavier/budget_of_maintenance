class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.order(:name)
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])

    if @workspace.update_attributes(workspace_params)
      redirect_to workspace_path(@workspace)
    else
      render :edit
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
    @equipment_types = @workspace.equipment_types.order(:name)
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
