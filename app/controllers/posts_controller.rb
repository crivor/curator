class PostsController < ApplicationController
  def index
  end

  def recent
    @posts = Post.where(:pubdate => 2.days.ago..Time.now).order(pubdate: :desc)
  end
end
