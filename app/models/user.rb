
class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password_confirmation

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end