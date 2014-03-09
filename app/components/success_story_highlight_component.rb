class SuccessStoryHighlightComponent < Cms::Component
  cms_page true

  image_accessor :image

  cms_attribute :title
  cms_attribute :summary
  cms_attribute :link_text
  cms_link_attribute :link
  cms_dragonfly_image_attribute :image

  cms_searchable_attributes :title, :summary
end

