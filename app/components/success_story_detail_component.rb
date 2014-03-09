class SuccessStoryDetailComponent < Cms::Component
  image_accessor :header_image
  image_accessor :sidebar_image
  file_accessor :pdf

  cms_page true

  cms_dragonfly_image_attribute :header_image
  cms_attribute :title
  cms_attribute :body, as: :textarea, class: 'wysiwyg', rows: 8
  cms_dragonfly_image_attribute :sidebar_image
  cms_link_attribute :sidebar_image_link
  cms_attribute :sidebar_text, as: :textarea, class: 'wysiwyg', rows: 8
  cms_dragonfly_file_attribute :pdf

  cms_searchable_attributes :title, :body, :sidebar_text
end

