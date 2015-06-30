class User < ActiveRecord::Base

	authenticates_with_sorcery!

	validates_confirmation_of :password

	has_many :lists
  has_many :transactions

end
