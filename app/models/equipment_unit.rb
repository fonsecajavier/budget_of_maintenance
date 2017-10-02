class EquipmentUnit < ApplicationRecord
  belongs_to :equipment_type
  has_many :maintenance_plans, through: :equipment_type

  validates_presence_of :name
  validates_presence_of :initial_hourmeter

  def monthly_usage
    equipment_type.default_monthly_usage
  end

  def max_yearly_usage
    @max_yearly_usage ||= initial_hourmeter + monthly_usage * 12
  end

  def maintenance_stops
    @maintenance_stops ||= SortedSet.new.tap do |stops|
      maintenance_plans.each do |plan|
        stops.merge maintenance_stops_for_plan(plan)
      end
    end.to_a
  end

  def all_monthly_budgets
    @all_monthly_budgets ||= Array.new.tap do |budget|
      current_usage = initial_hourmeter
      next_usage = current_usage + monthly_usage
      (1..12).each do |month|
        logger.info "Month #{month}"
        budget_for_month = []
        usage_range = [current_usage, next_usage - 1]

        stops_in_usage = maintenance_stops.find_all { |stop| stop.between?(*usage_range) }
        logger.info "Usage range: #{usage_range}"
        logger.info "Stops in usage: #{stops_in_usage}"

        stops_in_usage.each do |stop|
          logger.info "Analyzing stop #{stop}"
          plan_in_stop = maintenance_plans.order('interval DESC').find do |plan|
            maintenance_stops_for_plan(plan).include?(stop)
          end

          budget_for_month << {
            plan: plan_in_stop,
            stop: stop
          } if plan_in_stop

          logger.info "Found #{plan_in_stop.name} at #{stop}"
        end
        current_usage = next_usage
        next_usage += monthly_usage
        budget << budget_for_month
      end
    end
  end

  private

  def maintenance_stops_for_plan(plan)
    SortedSet.new.tap do |stops|
      current_stop = (initial_hourmeter.to_f / plan.interval).ceil * plan.interval
      while current_stop <= max_yearly_usage do
        stops << current_stop
        current_stop += plan.interval
      end
    end.to_a
  end

end
