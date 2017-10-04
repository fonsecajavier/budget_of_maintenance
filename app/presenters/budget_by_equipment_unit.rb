class BudgetByEquipmentUnit
  attr_accessor :workspace

  def initialize(workspace)
    self.workspace = workspace
  end

  def output
    @output ||= workspace.equipment_units.map do |unit|
      budget_per_month = (1..12).map do |month|
        unit.all_monthly_budgets[month - 1].sum { |monthly_budget| monthly_budget[:plan].cost }
      end

      {
        id: unit.id,
        equipment_type_id: unit.equipment_type.id,
        name: unit.name,
        budget_per_month: budget_per_month
      }
    end
  end

  def to_csv
    @csv_string ||= CSV.generate do |csv|
      csv << ['Equipment Name'].concat(Date::MONTHNAMES[1..-1])
      output.each do |unit|
        csv << [unit[:name]].concat(unit[:budget_per_month].map(&:to_i))
      end
    end
  end
end
