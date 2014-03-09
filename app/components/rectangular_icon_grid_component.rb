class RectangularIconGridComponent < Cms::Component
  cms_page true
  cms_subcomponent :rectangular_icon

  cms_attribute :title
  cms_attribute :description, as: :textarea, class: 'wysiwyg', rows: 5
  cms_attribute :background_style, as: :select, choices: { 'Solid' => 'solid', 'Pattern' => 'pattern' }
end

