class CommentsController < ApplicationController
add_flash_types :l_errado, :sucesso
before_action :verificaruser
before_action :verificarautorc, only: [:destroy]


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.c_user_id = current_user.id
    if @comment.save
      flash[:sucesso] = "Você criou um novo comentário."
      redirect_to article_path(@article)
    else

    end

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:l_errado] = "Você deletou um comentário seu."
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def verificarautorc
        if session[:user_id] == Comment.find(params[:id]).c_user_id || current_user.admin

        else
          flash[:l_errado] = "Você não é o autor original desse comentário."
          redirect_to users_path
        end
    end


end
