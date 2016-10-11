get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# get '/decks/new' do
# end

# post '/decks' do
# end
get '/decks/new' do
  @decks = Deck.all
  if session[:current_user_id]
    erb :'decks/create_deck'
  else
    params[:message] = "*You cannot add a deck without an account. Please login.*"
    erb :'decks/index'
  end
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'decks/show'
end


post '/decks' do
  @new_deck = Deck.new(title: params['title'], user_id: current_user.id)
  @new_deck.save
  get_id = @new_deck.id
  redirect "/decks/#{@new_deck.id}/cards/new"
end

get '/decks/:id/cards/new' do
  @deck = Deck.find(params[:id])
  if session[:current_user_id]
    @deck_id = params[:id]
    erb :'decks/create_card'
  else
    params[:message] = "*You cannot add a card without an account. Please login.*"
    erb :'decks/index'
  end
end

# if session[:current_user_id]
#     @deck_id = Deck.find_by(id: params[:id])
#     @deck_id = params[:id]
#     @new_deck = Deck.new(title: params['title'], user_id: current_user.id)
#     if request.xhr?
#       erb :"_new", layout: false, locals: {deck_id: @deck_id}
#     else
#       redirect "/decks/#{@new_deck.id}/cards/new"
#     end

post '/decks/:id/cards' do
  # p params
  new_card = Card.create!(question: params['question'], answer: params['answer'], deck_id: params[:id])
  # p new_card
  new_card.save
  if request.xhr?
    # content_type :json
    # new_card.to_json
    erb :"decks/_cardList", locals: {new_card: new_card}, layout: false
      # erb :"_new", layout: false, locals: {card_id: @card_id}
    else
      redirect "/decks/#{params[:id]}/cards/new"
    end
end

post "/decks/:id/rounds" do
  deck = Deck.find(params[:id])
  new_round = Round.create(deck: deck) # Add user later
  redirect "/rounds/#{new_round.id}"
end
