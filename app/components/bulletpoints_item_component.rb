class BulletpointItemComponent < Cms::Component
  cms_attribute :icon, as: :select, choices: Dir[Rails.root + 'public' + 'images' + 'bulletpoint_icons' + '*.png'].map {|i| icon = i.split('/').last; [icon.split('.').first.titlecase, icon]}.sort_by {|i| i[0]}
  cms_attribute :text

  cms_searchable_attributes :text
end
