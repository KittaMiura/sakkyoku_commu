class Users::PostsController < ApplicationController
  before_action :authenticate_user!


  def index
                                                             # ↓投稿を新しい順にしている
    @posts = Post.where(status: :true).page(params[:page]).per(8).order(id: "DESC")
    @tag_list=Tag.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:post][:name].delete(' ').delete('　').split(',')
    if params[:post]
      if @post.save
        @post.save_post(tag_list)
        redirect_to post_path(@post),notice:'投稿完了しました。'
      else
        notice:'投稿に失敗しました。'
      end
    else
      if @post.update(status: true)
        redirect_to user_path(current_user), notice: "下書き保存しました。"
      else
        notice:'投稿に失敗しました。'
        render:new
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    # pluckはmapと同じ意味
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].delete(' ').delete('　').split(',')
    if @post.update(post_params)
      @post.save_post(tag_list)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search

    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
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
    params.require(:post).permit(:title, :image, :introduction, :status)
  end

end