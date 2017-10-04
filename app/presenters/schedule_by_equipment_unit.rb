class ScheduleByEquipmentUnit
  attr_accessor :workspace

  def initialize(workspace)
    self.workspace = workspace
  end

  def output
    @output ||= workspace.equipment_units.map do |unit|
      {
        id: unit.id,
        equipment_type_id: unit.equipment_type_id,
        name: unit.name,
        all_monthly_budgets: unit.all_monthly_budgets
      }
    end
  end

  def to_csv
    @csv_string ||= CSV.generate do |csv|
      csv << ['Equipment Name'].concat(Date::MONTHNAMES[1..-1])
      output.each do |unit|
        month_cols = unit[:all_monthly_budgets].map do |monthly_budget|
          monthly_budget.map do |plan_with_stop|
            "#{plan_with_stop[:plan].name} at #{plan_with_stop[:stop]}"
          end.join(' - ')
        end

        csv << [unit[:name]].concat(month_cols)
      end
    end
  end
end
