class TweetJob < ActiveJob::Base
  queue_as :default

  def perform
    Post.where(tweeted_on: nil).each do |post|
      max_length = 142 - post.short_url.size
      title = post.title[0..max_length]
      tweet = Tweet.post([title, post.short_url].join(' ')) if LinkShrink.shortened?(post.short_url)
      post.update_attributes(tweeted_on: Time.now) if tweet
    end
  end
end
