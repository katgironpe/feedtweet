require './lib/feed_reader'

class FetchPostJob < ActiveJob::Base
  queue_as :default

  def perform
    FeedReader.fetch
  end
end
