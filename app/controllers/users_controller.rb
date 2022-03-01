class UsersController < ApplicationController
  add_flash_types :l_errado, :sucesso
  skip_before_action :verificaruser, only: [:show, :new, :create, :index, :lscreen, :logar]
  before_action :verificarperfil, only: [:edit, :update, :destroy]


  def lscreen
  end

  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def adminpage
    @user = User.all

  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:sucesso] = "Você atualizou os dados de sua conta."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def logar
    @user = User.find_by(username: user_params[:username], senha:  Digest::MD5.hexdigest(user_params[:senha]))
    if @user
      session[:user_id] = @user.id
      flash[:sucesso] = "Você se logou na sua conta! Bem-vindo."
      redirect_to articles_path
    else
      @user = User.new
      @error = "usuario e senha invalido"
      render 'index'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to articles_path
  end

  def create
    @user = User.new(user_params)
    @user.senha = Digest::MD5.hexdigest @user.senha
    @user.senha_confirmation = Digest::MD5.hexdigest @user.senha_confirmation
    #@user.confirma_senha = Digest::MD5.hexdigest @user.confirma_senha
    if @user.save

      flash[:sucesso] = "Você criou sua conta, agora só falta se logar!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if(@user.id != current_user.id)
      flash[:l_errado] = "Você deletou uma conta"
      redirect_to adminpage_path
    else
      flash[:l_errado] = "Você deletou sua conta"
      logout
    end


  end

private
  def user_params
    params.require(:user).permit(:username, :email, :senha, :idade, :confirma_senha, :imgurl, :admin, :senha_confirmation)
  end

  def verificarperfil
    @user = User.find(params[:id])
    if current_user.id == @user.id || current_user.admin

    else

      flash[:l_errado] = "Você não tem acesso a essa parte desse perfil."
      redirect_to users_path

    end
  end

end
