require 'rails_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  it { should validate_uniqueness_of(:link) }
end
