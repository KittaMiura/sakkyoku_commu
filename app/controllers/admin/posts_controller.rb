class Admin::PostsController < ApplicationController

  def index
                                                             # ↓投稿を新しい順にしている
    @posts = Post.where(status: :true).page(params[:page]).order(id: "DESC")
    @tag_list=Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
  end

end
