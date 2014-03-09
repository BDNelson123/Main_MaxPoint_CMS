class SlideshowImageComponent < Cms::Component
  image_accessor :image

  cms_attribute :caption, as: :textarea, rows: '5', class: 'span5'
  cms_dragonfly_image_attribute :image

  cms_attribute :link_text
  cms_link_attribute :link
end

