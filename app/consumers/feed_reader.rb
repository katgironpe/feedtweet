require 'open-uri'
require 'htmlentities'

class FeedReader
  class << self
    def decode(string)
      HTMLEntities.new.decode(string)
    end

    def feeds
      YAML.load_file('./config/feeds.yml')['feeds']
    end

    def save_post(post)
      Post.create(title: decode(post.title.force_encoding('utf-8')), link: post.link)
    end

    def fetch
      feeds.each do |feed|
        feed.each do |f|
          rss = SimpleRSS.parse open(f['link']) if f['link']
          rss.items.each { |r| save_post(r) } if rss
        end
      end
    end
  end
end
