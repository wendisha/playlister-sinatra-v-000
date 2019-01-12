class ArtistsController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect "/tweets" 
    else
      erb :"users/create_user"
    end
  end
  
  post '/signup' do 
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect '/tweets'
    else 
      redirect '/signup'
    end
  end
end
