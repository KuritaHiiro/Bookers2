class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book =@user.books
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :introduction, :profile_image)
  end
end
