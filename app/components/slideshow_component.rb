class SlideshowComponent < Cms::Component
  cms_page true

  cms_subcomponent :slideshow_image

  cms_attribute :caption_style, as: :select, choices: [['Square', 'square'], ['Rectangle', 'rectangle']]
end
