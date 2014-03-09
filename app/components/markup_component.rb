class MarkupComponent < Cms::Component
  cms_page true

  cms_attribute :html_code, label: 'HTML Code', as: :textarea, rows: 10
end

