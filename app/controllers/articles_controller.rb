class ArticlesController < ApplicationController
skip_before_action :verificaruser, only: [:index, :show]
before_action :verificarautor
skip_before_action :verificarautor, only: [:index, :show, :new, :create]
add_flash_types :l_errado, :sucesso, :aviso

def new
  @article = Article.new
end

def show
  @article = Article.find(params[:id])
  @autor = User.find(@article.user_id)
end

def create
  @article = Article.new(article_params)
  @article.user_id = current_user.id
  @article.data = Date.today
  if @article.save
    flash[:sucesso] = "Você criou um novo artigo."
    redirect_to @article
  else
    render 'new'
  end
end

def index
  @articles = Article.all
  @autors = User.all
end


def edit
  @article = Article.find(params[:id])
end


def update

  @article = Article.find(params[:id])

  if @article.update(article_params)
    flash[:sucesso] = "Você editou um  artigo."
    redirect_to @article
  else

    render 'edit'


  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def verificarautor
      if session[:user_id] == Article.find(params[:id]).user_id || current_user.admin

      else
        flash[:l_errado] = "Você não é o autor original desse artigo."
        redirect_to users_path
      end
  end



end
