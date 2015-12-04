class User < ActiveRecord::Base
# associations
has_many :guesses
has_many :rounds
has_many :decks
has_many :played_decks, through: :rounds, source: :decks

# validations
validates :name, :password, { presence: true }
validates :email, uniqueness: true
validates :email, format: { with: /\A.+@.+\..+\z/ }

# authentication
  def password
    BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    self.hashed_password = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)

    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end