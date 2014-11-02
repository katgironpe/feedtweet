class PostsController < ApplicationController
  def index
    Post.order('tweeted_on DESC')
  end
end
