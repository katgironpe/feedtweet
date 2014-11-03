require 'rails_helper'

describe FeedReader do
  describe '.decode' do
    it 'converts HTML entities' do
      expect(FeedReader.decode('How to use Ruby&#8217;s English')).to eq('How to use Ruby’s English')
    end
  end
end
