class BookmarkManager < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/links'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'user/new'
    end
  end

end
