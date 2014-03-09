class InActionItem1Component < Cms::Component
  image_accessor :image

  cms_dragonfly_image_attribute :image
  cms_attribute :highlight1
  cms_attribute :text1
  cms_attribute :highlight2
  cms_attribute :text2
  cms_attribute :link_text
  cms_link_attribute :link

  cms_searchable_attributes :highlight1, :text1, :highlight2, :text2
end

