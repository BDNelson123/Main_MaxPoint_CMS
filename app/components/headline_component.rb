class HeadlineComponent < Cms::Component
  cms_page true

  image_accessor :background_image

  cms_dragonfly_image_attribute :background_image
  cms_attribute :gravity, as: :select, choices: {'Top' => 'top', 'Middle' => 'middle'}
  cms_attribute :text, as: :textarea, rows: '5', class: 'span3'

  cms_attribute :link_text
  cms_link_attribute :link
end
