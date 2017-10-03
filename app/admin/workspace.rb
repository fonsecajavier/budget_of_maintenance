ActiveAdmin.register Workspace do
  permit_params :name, :default_monthly_usage

  action_item :budget_by_equipment_type, only: :show do
    link_to 'Budget by Equipment Type', budget_by_equipment_type_admin_workspace_path(workspace)
  end

  action_item :budget_by_equipment_unit, only: :show do
    link_to 'Budget by Equipment Unit', budget_by_equipment_unit_admin_workspace_path(workspace)
  end

  sidebar 'Workspace Details', only: [:show, :edit] do
    ul do
      li link_to('Equipment Types', admin_workspace_equipment_types_path(workspace))
    end
  end

  controller do
    def new(options={}, &block)
      r = build_resource
      r.default_monthly_usage ||= AppConstants::DEFAULT_MONTHLY_USAGE
      respond_with(*with_chain(r), options, &block)
    end
  end

  member_action :budget_by_equipment_type do
    @presenter = BudgetByEquipmentType.new(resource)
  end

  member_action :budget_by_equipment_unit do
    @presenter = BudgetByEquipmentUnit.new(resource)
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
