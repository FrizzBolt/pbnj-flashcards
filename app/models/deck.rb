class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_many :rounds

  validates :title, presence: true
end
