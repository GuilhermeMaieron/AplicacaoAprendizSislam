class Login < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  #attr_accessor :confirma_senha
  validates :username, null: false, length: { minimum: 5 }
  validates :email, null: false, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :senha, null: false, length: { minimum: 6 }
  validates :idade, null: false
  validates_confirmation_of :senha 
  #validate :confirma_senha_igual, on: :create



  def confirma_senha_igual
    if(confirma_senha == senha)
      return true
    else
      errors.add(:confirma_senha, ': As senhas não estão iguais')
    end

  end
end
