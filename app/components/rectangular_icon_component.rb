class RectangularIconComponent < Cms::Component
  image_accessor :background_image

  cms_attribute :text, as: :textarea, rows: '5', class: 'span4'
  cms_attribute :link_text
  cms_link_attribute :link
  cms_dragonfly_image_attribute :background_image

  #validates :title, presence: true
  #validates :description, presence: true
  #validates :call_to_action, presence: true
  #validates :url, presence: true

  #validates :color, presence: true
end
