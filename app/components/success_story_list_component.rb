class SuccessStoryListComponent < Cms::Component
  cms_page true

  cms_subcomponent :success_story_list_item

  cms_attribute :title
end

