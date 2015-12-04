class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round

  def message
    return "That's Correct!" if correctness
    "That is incorrect..."
  end

end
