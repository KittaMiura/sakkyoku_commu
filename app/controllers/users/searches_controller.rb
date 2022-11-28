class Users::SearchesController < ApplicationController

  def search

    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:word]).page(params[:page]).per(8).order(id: "DESC")
    else
      @posts = Post.search(params[:word]).page(params[:page]).per(8).order(id: "DESC")
    end

  end
end
