ActiveAdmin.register EquipmentType do
  belongs_to :workspace
  permit_params :name, :default_monthly_usage, maintenance_plans_attributes: [:id, :_destroy, :name, :cost, :interval]

  sidebar 'Equipment Type Details', only: [:show, :edit] do
    ul do
      li link_to('Equipment Units', admin_equipment_type_equipment_units_path(equipment_type))
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :default_monthly_usage
    end
    f.inputs do
      f.has_many :maintenance_plans, allow_destroy: true do |fp|
        fp.input :name
        fp.input :cost
        fp.input :interval
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :default_monthly_usage
      row :workspace
      row :created_at
      row :updated_at
    end

    panel 'Maintenance plans' do
      equipment_type.maintenance_plans.each do |mp|
        attributes_table_for mp do
          row :name
          row('Cost') { number_to_currency(mp.cost) }
          row :interval
        end
      end
    end
    active_admin_comments
  end

  controller do
    def new(options={}, &block)
      r = build_resource
      r.maintenance_plans.build(AppConstants::DEFAULT_MAINTENANCE_PLANS)
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
