class LoginsController < ApplicationController
  add_flash_types :l_errado, :sucesso
  skip_before_action :verificarlogin, only: [:show, :new, :create, :index, :lscreen, :logar]
  before_action :verificarperfil, only: [:edit, :update, :destroy]


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

  def adminpage
    @login = Login.all

  end


  def update
    @login = Login.find(params[:id])

    if @login.update(login_params)
      flash[:sucesso] = "Você atualizou os dados de sua conta."
      redirect_to @login
    else
      render 'edit'
    end
  end

  def logar
    @login = Login.find_by(username: login_params[:username], senha:  Digest::MD5.hexdigest(login_params[:senha]))
    if @login
      session[:login_id] = @login.id
      flash[:sucesso] = "Você se logou na sua conta! Bem-vindo."
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
    @login.senha = Digest::MD5.hexdigest @login.senha
    @login.senha_confirmation = Digest::MD5.hexdigest @login.senha_confirmation
    #@login.confirma_senha = Digest::MD5.hexdigest @login.confirma_senha
    if @login.save

      flash[:sucesso] = "Você criou sua conta, agora só falta se logar!"
      redirect_to logins_path
    else
      render 'new'
    end
  end

  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    if(@login.id != current_user.id)
      flash[:l_errado] = "Você deletou uma conta"
      redirect_to adminpage_path
    else
      flash[:l_errado] = "Você deletou sua conta"
      logout
    end


  end

private
  def login_params
    params.require(:login).permit(:username, :email, :senha, :idade, :confirma_senha, :imgurl, :admin, :senha_confirmation)
  end

  def verificarperfil
    @login = Login.find(params[:id])
    if current_user.id == @login.id || current_user.admin

    else

      flash[:l_errado] = "Você não tem acesso a essa parte desse perfil."
      redirect_to logins_path

    end
  end

end
