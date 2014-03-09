class LogoBarItemComponent < Cms::Component
  image_accessor :image

  cms_attribute :title
  cms_dragonfly_image_attribute :image
end

