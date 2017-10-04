ActiveAdmin.register EquipmentUnit do
  belongs_to :equipment_type
  permit_params :name, :monthly_usage, :initial_hourmeter

  controller do
    def after_save(success, failure, view_for_failure)
      success.html { redirect_to new_admin_equipment_type_equipment_unit_path(resource.equipment_type), notice: "Equipment Unit #{resource.name} succesfully saved" }
      failure.html do
        flash.now[:alert] = 'Some errors prevented this Equipment Unit from being saved'
        render view_for_failure
      end
    end

    def new(options={}, &block)
      r = build_resource
      r.monthly_usage ||= r.equipment_type.default_monthly_usage
      respond_with(*with_chain(r), options, &block)
    end

    def create
      super { |success, failure| after_save success, failure, :new }
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
