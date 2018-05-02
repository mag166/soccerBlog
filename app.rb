require 'sinatra'
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"

enable :sessions

set :database, "sqlite3:app.db"

get "/" do
erb :index
end

get "/sign-in" do
    erb :sign_in
  end
  
  # responds to sign in form
  post "/sign-in" do
    @user = User.find_by(username: params[:username])
  
    # checks to see if the user exists
    #   and also if the user password matches the password in the db
    if @user && @user.password == params[:password]
      # this line signs a user in
      session[:user_id] = @user.id
  
      # lets the user know that something is wrong
      flash[:info] = "You have been signed in"
  
      # redirects to the home page
      redirect "/"
    else
      # lets the user know that something is wrong
      flash[:warning] = "Your username or password is incorrect"
  
      # if user does not exist or password does not match then
      #   redirect the user to the sign in page
      redirect "/sign-in"
    end
  end

  get "/sign-up" do
    erb :sign_up
  end
  
  post "/sign-up" do
    @user = User.create(
      username: params[:username],
      password: params[:password]
    )
  
    # this line does the signing in
    session[:user_id] = @user.id
  
    # lets the user know they have signed up
    flash[:info] = "Thank you for signing up"
  
    # assuming this page exists
    redirect "/"
  end


