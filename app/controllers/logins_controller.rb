class LoginsController < ApplicationController
  skip_before_action :verificarlogin
  def lscreen
  end

  def new
    @login = Login.new
  end

  def index
    @login = Login.new
  end

  def show
    @login = Login.find(params[:id])
  end

  def edit
    @login = Login.find(params[:id])
  end


  def update
    @login = Login.find(params[:id])

    if @login.update(login_params)
      redirect_to @login
    else
      render 'edit'
    end
  end

  def logar

    @login = Login.find_by(username: login_params[:username], senha: login_params[:senha])
    if @login
      session[:login_id] = @login.id
      redirect_to articles_path
    else
      @login = Login.new
      @error = "usuario e senha invalido"
      render 'index'
    end
  end

  def logout
    session[:login_id] = nil
    redirect_to articles_path
  end

  def create
    @login = Login.new(login_params)
    if @login.save
      redirect_to logins_path
    else
      render 'new'
    end
  end

  def destroy
    @login = Login.find(params[:id])
    @login.destroy

  end

private
  def login_params
    params.require(:login).permit(:username, :email, :senha, :idade, :confirma_senha, :imgurl)
  end
end
