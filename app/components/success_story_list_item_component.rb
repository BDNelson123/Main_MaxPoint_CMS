class SuccessStoryListItemComponent < Cms::Component
  image_accessor :image

  cms_dragonfly_image_attribute :image
  cms_attribute :title
  cms_attribute :summary, as: :textarea
  cms_attribute :link_text
  cms_link_attribute :link
end


