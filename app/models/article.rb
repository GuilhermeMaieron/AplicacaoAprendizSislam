class Article < ActiveRecord::Base
  belongs_to :login
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                  length: { minimum: 5 }
end
