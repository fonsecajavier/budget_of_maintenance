class EquipmentTypesController < ApplicationController
  before_action :load_workspace

  def new
    @equipment_type = @workspace.equipment_types.build
  end

  def create
    @equipment_type = @workspace.equipment_types.build(equipment_type_params)
    if @equipment_type.save
      redirect_to workspace_equipment_type_path(@equipment_type.workspace, @equipment_type)
    else
      render :new
    end
  end

  def show
    @equipment_type = @workspace.equipment_types.find(params[:id])
    @equipment_units = @equipment_type.equipment_units
  end

  private

  def equipment_type_params
    params.require(:equipment_type).permit(:name)
  end

  def load_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end
