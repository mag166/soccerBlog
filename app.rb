require 'sinatra'
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"
require 'pry'


enable :sessions

set :database, "sqlite3:app.db"

get "/" do
erb :index
end
#CODE SOURCED FROM ORLANDO EXAMPLE
get "/sign-in" do
    erb :sign_in
  end
  
  post "/sign-in" do
    @user = User.find_by(username: params[:username])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
  
      flash[:info] = "You have been signed in"
  
      redirect "/"
    else
      flash[:warning] = "Your username or password is incorrect"
  
      redirect "/sign-in"
    end
  end

  get "/sign-up" do
    erb :sign_up
  end
  
  post "/sign-up" do
    @user = User.create(
      username: params[:username],
      password: params[:password],
      birthday: params[:birthday],
      email: params[:email]
    )
  
    session[:user_id] = @user.id
  
    flash[:info] = "Thank you for signing up"
    redirect "/"
  end

  get "/sign-out" do
    # this is the line that signs a user out
    session[:user_id] = nil
  
    # lets the user know they have signed out
    flash[:info] = "You have been signed out"
    
    redirect "/"
  end



  binding.pry
