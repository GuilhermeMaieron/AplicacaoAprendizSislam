class ArticlesController < ApplicationController
skip_before_action :verificarlogin, only: [:index, :show]
before_action :verificarautor
skip_before_action :verificarautor, only: [:index, :show, :new, :create]

def new
  @article = Article.new
end

def show
  @article = Article.find(params[:id])
  @autor = Login.find(@article.login_id)

end

def create
  @article = Article.new(article_params)
  @article.login_id = current_user.id
  @article.data = Date.today
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def index
  @articles = Article.all
  @autors = Login.all
end


def edit
  @article = Article.find(params[:id])
end


def update

  @article = Article.find(params[:id])

  if @article.update(article_params)
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
      if session[:login_id] == Article.find(params[:id]).login_id

      else
        flash[:alert] = "ta errado"
        redirect_to logins_path
      end
  end



end
