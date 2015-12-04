
  enable :sessions
# go to index
get "/" do
	erb :"/index"
end

# **************** User Registration ***************
# Render registration form
get "/users/new" do
	@user = User.new
	erb :"users/new"
end

# Save new user to database or display errors
post "/users" do
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if @user.save
		redirect "/users/show"
	else
		@message = "Registration unsuccessful, please try again."
		erb :"users/new" 
	end
end

# **************** User Login ***************
#  Render login form
get "/sessions/new" do
	erb :"users/login"
end

#  Verify user exists in database or display errors
post "/sessions" do
	@user = User.authenticate(params[:email], params[:password])
  if @user != nil
    session[:current_user_id] = @user.id
    redirect "/users/show"
  else
    @message = "Login unsuccessful, please try again."
		erb :"users/login" 
  end
end

# **************** User Profile ***************
#  User profile (restricted)
get "/users/:id" do
	if current_user
    @user = current_user
    erb :"users/show"
  else
    erb :"/users/login"
  end
end

#  Edit profile form(restricted)
get "/users/:id/edit" do
	if current_user
    @user = current_user
    erb :"/users/edit"
  else
    erb :"/users/login"
  end
end

put "/users/:id" do
	if current_user
    @user = current_user
    redirect "/users"
  else
    erb :"/users/login"
  end
end


# **************** User Logout ***************
# End session
delete "/sessions" do
  session.delete(:current_user_id)
  redirect "/sessions/new"
end


