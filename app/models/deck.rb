class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_many :rounds

  validates :title, presence: true

  def round_deck
    round_deck=self.cards.dup
  end

  def shuffle_deck
    round_deck.each do |flashcard|
      unless flashcard.correct
        round_deck.delete(flashcard)
      end
    end
    round_deck.shuffle!
  end


end
