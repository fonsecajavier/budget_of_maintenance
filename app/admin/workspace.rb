ActiveAdmin.register Workspace do
  permit_params :name, :default_interval_of_maintenance

  sidebar 'Workspace Details', only: [:show, :edit] do
    ul do
      li link_to('Equipment Types', admin_workspace_equipment_types_path(workspace))
    end
  end

  form do |f|
    inputs do
      input :name
      input :default_interval_of_maintenance, input_html: { placeholder: AppConstants::DEFAULT_INTERVAL_OF_MAINTENANCE }
    end
    actions
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
