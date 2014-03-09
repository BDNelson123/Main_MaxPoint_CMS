class BulletpointsComponent < Cms::Component
  cms_page true

  cms_subcomponent :bulletpoint_item

  cms_attribute :title
  cms_attribute :header_text, as: :textarea, class: 'wysiwyg', rows: 8
  cms_attribute :footer_text, as: :textarea, class: 'wysiwyg', rows: 8

  cms_searchable_attributes :title, :header_text, :footer_text
end
