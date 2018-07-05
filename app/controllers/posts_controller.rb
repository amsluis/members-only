class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @user = current_user
  end

  def create
    content = params.require(:post).permit(:content)[:content]
    user = current_user
    puts "NNNNNNNNNNN" + user.name
    post = Post.new(user_id: user.id, content: content)
    post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end
end
