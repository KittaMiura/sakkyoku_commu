class Admin::PostsController < ApplicationController

  def index
                                                             # ↓投稿を新しい順にしている
    @posts = Post.where(status: :true).page(params[:page]).per(8).order(id: "DESC")
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

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      render "edit"
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @posts=@tag.posts.page(params[:page]).per(8)
  end

  private

    def post_params
      params.require(:post).permit(:is_ban)
    end

end
