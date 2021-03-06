require 'sinatra'
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"
require 'pry'


enable :sessions

configure :development do
  set :database, "sqlite3:app.db"
end

# this will ensure this will only be used on production
configure :production do
  # this environment variable is auto generated/set by heroku
  #   check Settings > Reveal Config Vars on your heroku app admin panel
  set :database, ENV["DATABASE_URL"]
end



get "/" do
    @posts = Post.all
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

  get "/posts/:id" do
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
    erb:user_posts
  end
  
  post "/sign-up" do
    @user = User.create(
      firstName: params[:firstName],
      lastName: params[:lastName],
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

  get "/new-post" do
    erb :new_post
  end

  post "/new-post" do
    @post = Post.create(
      title: params[:title],
      content: params[:content],
      img_link: params[:img_link],
      user_id: session[:user_id]
    )

    redirect "/"
  end


  get "/delete-post/:id" do
    post = Post.find(params[:id])
    Post.destroy(post.id)
    redirect "/"
  end

  get "/delete-post-profile/:id" do
    post = Post.find(params[:id])
    Post.destroy(post.id)
    redirect "/posts/#{session[:user_id]}"
  end

  get "/edit-profile" do
    @user = User.find(session[:user_id])
    erb:edit_profile
  end

  get "/delete-profile" do
    @user = User.find(session[:user_id])
    posts = Post.all
    for post in posts
      if post.id == User.find(session[:user_id]).id
        Post.destroy(post.id)
      end
    end
    @destroy = @user.destroy
    session[:user_id] = nil
    redirect "/"
  end



  post "/edit-profile" do
    @user = User.update(
      firstName: params[:firstName],
      lastName: params[:lastName],
      username: params[:username],
      password: params[:password],
      birthday: params[:birthday],
      email: params[:email]
    )

    redirect "/posts/#{session[:user_id]}"
  end
  # binding.pry
