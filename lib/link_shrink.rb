class LinkShrink
  class << self
    def bitly
      Bitly.use_api_version_3
      Bitly.new(Settings.bitly.login, Settings.bitly.key)
    end

    def shortened?(link)
      ['bit.ly', 'j.mp'].each do |host|
        link.include?(host)
      end
    end

    def shorten(link)
      return bitly.shorten(link).short_url
    rescue => e
      Rails.logger.debug e
      return nil
    end
  end
end
