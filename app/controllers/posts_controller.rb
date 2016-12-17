class PostsController < ApplicationController
  def index
    path = [params[:year], params[:month]].compact.join('/').presence
    @posts = Post.all path: path

    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
