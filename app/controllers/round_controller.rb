get "/rounds/:id" do
 #@round = Round.find(params[:id])
 erb :'rounds/index'
end

post "/rounds/:id" do
  round = Round.find(params[:id])
  guess = params[:guess]
  round.make_guess(guess)
  redirect '/rounds/:id'
end

get "/rounds/:id/finished" do

end
