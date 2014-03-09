class DefinitionComponent < Cms::Component
  cms_page true

  #cms_subcomponent :bulletpoint_item

  cms_attribute :title
  cms_attribute :term1
  cms_attribute :definition1
  cms_attribute :term2
  cms_attribute :definition2
end

