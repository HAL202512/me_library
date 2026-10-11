class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :work

  has_many :reflections, dependent: :destroy
  has_many :memory_tags, dependent: :destroy
  has_many :tags, through: :memory_tags
end