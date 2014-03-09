class RelatedComponent < Cms::Component
  cms_page true

  image_accessor :left_background_image
  image_accessor :center_background_image
  image_accessor :right_background_image

  cms_attribute :left_text
  cms_attribute :left_link_text
  cms_link_attribute :left
  cms_dragonfly_image_attribute :left_background_image

  cms_attribute :center_text
  cms_attribute :center_link_text
  cms_link_attribute :center
  cms_dragonfly_image_attribute :center_background_image

  cms_attribute :right_text
  cms_attribute :right_link_text
  cms_link_attribute :right
  cms_dragonfly_image_attribute :right_background_image
end

