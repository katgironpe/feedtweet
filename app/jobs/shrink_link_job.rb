class ShrinkLinkJob < ActiveJob::Base
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.update_attributes(short_url: LinkShrink.shorten(post.link))
  end
end
