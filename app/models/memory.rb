class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :work

  has_many :reflections, dependent: :destroy
end