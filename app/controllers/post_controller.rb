class PostController < ApplicationController
  def index #게시글 전체를 보여줌
  @posts=Post.all
  
  end

  def new #게시글 작성 페이지
  end

  def create #작성된 게시글 DB에 생성
  Post.create(
    title: params[:title],
    content: params[:content]
    )
  redirect_to '/'
  
  end

  def show #하나의 게시글 확인 페이지(댓글 포함)
    @post_id = params[:id]
    @post = Post.find(@post_id)

  
  end

  def create_comment #해당하는 글에 댓글작성하는 액션 
    @post_id = params[:id]
    @comment = params[:comment]
    
    Comment.create(
      post_id: @post_id,
      content: @comment
      )
      
    redirect_to :back
  
  
  end
end
