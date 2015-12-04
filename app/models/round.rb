class Round < ActiveRecord::Base

  @card_index = 1

  belongs_to :deck
  belongs_to :user
  has_many :guesses, class_name: "Guess", foreign_key: :round_id

  def make_guess(guess)
    card = deck.cards.find(@card_index)
    correctness = guess_correct?(guess)
    @card_index += 1
    guesses.create(Guess.new(correctness: correctness))
  end

  private

  def guess_correct?(card, guess)
    guess.downcase == card.answer.downcase
  end

end
