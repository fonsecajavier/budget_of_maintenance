class BudgetByEquipmentType
  attr_accessor :workspace

  def initialize(workspace)
    self.workspace = workspace
  end

  def output
    @output ||= workspace.equipment_types.map do |equipment_type|
      budget_per_month = (1..12).map do |month|
        equipment_type.equipment_units.sum do |unit|
          unit.all_monthly_budgets[month - 1].sum { |monthly_budget| monthly_budget[:plan].cost }
        end
      end

      {
        id: equipment_type.id,
        name: equipment_type.name,
        budget_per_month: budget_per_month
      }
    end
  end

  def to_csv
    @csv_string ||= CSV.generate do |csv|
      csv << ['Equipment Type'].concat(Date::MONTHNAMES[1..-1])
      output.each do |unit|
        csv << [unit[:name]].concat(unit[:budget_per_month].map(&:to_i))
      end
    end
  end
end
