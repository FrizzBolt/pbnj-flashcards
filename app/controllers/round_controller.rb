get "/rounds/:id" do
 @round = Round.find(params[:id])
 erb :'rounds/index'
end

post "/rounds/:id" do
  round = Round.find(params[:id])
  guess = params[:guess]
  round.make_guess(guess)
  if(round.finished?)
    redirect "/rounds/#{params[:id]}/finished"
  else
    redirect "/rounds/#{params[:id]}"
  end
end

get "/rounds/:id/finished" do
  @round = Round.find(params[:id])
  erb :'rounds/finished'
end
