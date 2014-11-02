require './app/consumers/feed_reader'

class FetchPostJob < ActiveJob::Base
  queue_as :default

  def perform
    FeedReader.fetch
  end
end
