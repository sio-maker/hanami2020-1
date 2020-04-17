class PostsController < ApplicationController

  before_action :authenticate_user!,except:[:index,:show]
  
  def index
    @posts=Post.all.order(id: "DESC")
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice]="投稿が保存されました！"
      redirect_to :action =>"index"
    else

      render ("posts/new")
    end  
  end


  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      flash[:notice]="投稿が編集されました！"
      redirect_to :action => "show", :id => @post.id
    else
      render ("posts/edit")
    end
  end

  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end



  private
  def posts_params
    params.require(:post).permit(:gole,:who,:where)
  end


end
