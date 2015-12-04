get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# get '/decks/new' do
# end

# post '/decks' do
# end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end

post "/decks/:id/rounds" do
  deck = Deck.find(params[:id])
  new_round = Round.create(deck: deck) # Add user later
  redirect "/rounds/#{new_round.id}"
end
