require 'cgi'

module SearchHelper
  def snippet_for(page, term = nil)
    truncate(strip_tags(page.components.map {|c| component_attributes(c) }.join(' ')), length: 300).html_safe
  end
  def component_attributes(component)
    return [] if component.nil?
    component.searchable_attributes.map{|a| component.data[a.to_s]} + component_attributes(component.subcomponents)
  end
end
