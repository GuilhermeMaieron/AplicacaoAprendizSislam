class CommentsController < ApplicationController

before_action :verificarlogin
before_action :verificarautorc


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.c_login_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else

    end

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def verificarautorc
        if session[:login_id] == Comment.find(params[:id]).c_login_id

        else

          redirect_to logins_path
        end
    end


end
