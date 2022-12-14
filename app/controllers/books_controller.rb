class BooksController < ApplicationController
before_action :correct_book, only: [:edit, :update]

  def new
    @book=Book.new

  end
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
       redirect_to book_path(@book.id)
    else
       @books=Book.all

      render :index
    end

  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
    @user=current_user
    @book_comment=BookComment.new
  end

  def edit
    @book=Book.find(params[:id])

  end
  def update
    @book=Book.find(params[:id])
    if  @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else

      render :edit
    end


  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    @book = Book.find(params[:id])
    unless @book.user.id==current_user.id
      redirect_to books_path
    end

  end


end
