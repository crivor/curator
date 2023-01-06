class PostsController < ApplicationController
  def index
  end

  def recent
    @posts = Post.recent
  end
end
