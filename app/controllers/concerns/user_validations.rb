require 'active_support/concern'

module UserValidations
  extend ActiveSupport::Concern

  included do
    validates :password_digest, :presence => true
    validates :password, :length => { :minimum => 6, :allow_nil => true }
    validates :session_token, :presence => true, :uniqueness => true
    validates :username, :presence => true, :uniqueness => true
  end

end