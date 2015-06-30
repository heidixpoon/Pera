class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }

  has_many :lists

end
