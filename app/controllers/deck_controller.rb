get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# get '/decks/new' do
# end

# post '/decks' do
# end
get '/decks/new' do
  if session[:current_user_id]
    erb :'decks/create_deck'
  else
    erb :'decks/index'
  end
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'decks/show'
end


post '/decks' do
  new_deck = Deck.new(title: params['title'], user_id: current_user.id)
  new_deck.save
  get_id = new_deck.id
  redirect "/decks/#{get_id}/cards/new"
end

get '/decks/:id/cards/new' do
  if session[:current_user_id]
    @deck_id = params[:id]
    erb :'decks/create_card'
  else
    erb :'decks/index'
  end
end

post '/decks/:id/cards' do
  new_card = Card.create!(question: params['question'], answer: params['answer'], deck_id: params[:id])
  new_card.save
  redirect "/decks/#{params[:id]}/cards/new"
end

post "/decks/:id/rounds" do
  deck = Deck.find(params[:id])
  new_round = Round.create(deck: deck) # Add user later
  redirect "/rounds/#{new_round.id}"
end
