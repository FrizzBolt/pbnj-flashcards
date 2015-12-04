class Round < ActiveRecord::Base

  belongs_to :deck
  belongs_to :user
  has_many :guesses, class_name: "Guess", foreign_key: :round_id

  def make_guess(guess)
    card = deck.cards[self.card_index]
    self.card_index += 1
    self.save
    correctness = guess_correct?(card, guess)
    self.guesses.create(correctness: correctness)
  end

  def cards_left_string
    "#{deck.cards.count - self.card_index} cards left"
  end

  def answered_correctly_string
    correct = 0
    guesses.each { |guess| correct += 1 if guess.correctness }
    "#{correct} out of #{deck.cards.count}"
  end

  def finished?
    return self.card_index >= deck.cards.count
  end

  private

  def guess_correct?(card, guess)
    guess.downcase == card.answer.downcase
  end
end
