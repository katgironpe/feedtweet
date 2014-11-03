class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true, on: :update

  after_save :shorten_url

  def shorten_url
    ShrinkLinkJob.perform_later(id)
  end
end
