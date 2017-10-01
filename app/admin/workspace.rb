ActiveAdmin.register Workspace do
  permit_params :name, :default_maintenance_interval

  sidebar 'Workspace Details', only: [:show, :edit] do
    ul do
      li link_to('Equipment Types', admin_workspace_equipment_types_path(workspace))
    end
  end

  controller do
    def new(options={}, &block)
      r = build_resource
      r.default_maintenance_interval ||= AppConstants::DEFAULT_MAINTENANCE_INTERVAL
      respond_with(*with_chain(r), options, &block)
    end

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
