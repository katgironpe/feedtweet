require 'rails_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  it { should validate_uniqueness_of(:link) }
  it { should validate_presence_of(:short_url).on(:update) }
  it { should validate_uniqueness_of(:short_url).on(:update) }
end
