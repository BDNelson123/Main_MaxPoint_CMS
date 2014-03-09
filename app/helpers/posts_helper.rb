module PostsHelper
  def published_at(post)
    return if post.nil?
    post.published_at.strftime("%m.%d.%Y")
  end
  def created_at(post)
    return if post.nil?
    post.created_at.strftime("%m.%d.%Y")
  end
end
