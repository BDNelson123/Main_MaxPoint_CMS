class InActionItem3Component < Cms::Component
  image_accessor :image

  cms_dragonfly_image_attribute :image
  cms_attribute :text
  cms_attribute :link_text
  cms_link_attribute :link
end
