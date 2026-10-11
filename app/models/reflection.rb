class Reflection < ApplicationRecord
  belongs_to :memory
  has_many :reflection_tags, dependent: :destroy
  has_many :tags, through: :reflection_tags
end
