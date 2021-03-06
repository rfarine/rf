class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(posts_path, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'Logged out!')
  end
end
