ActiveAdmin.register EquipmentType do
  belongs_to :workspace
  permit_params :name

  sidebar 'Equipment Type Details', only: [:show, :edit] do
    ul do
      li link_to('Equipment Units', admin_workspace_equipment_type_equipment_units_path(equipment_type.workspace, equipment_type))
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
