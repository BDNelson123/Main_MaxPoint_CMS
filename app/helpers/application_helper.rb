module ApplicationHelper
  def f(str)
    raw h(str).gsub("\n", "<br/>\n")
  end

  def month_name(month)
    %w( _ January February March April May June July
        August September October November December )[month]
  end

  def target(component, attribute)
    _target = component.send("#{attribute}_target")
    return unless _target.present?
    "target=\"#{_target}\""
  end
end
