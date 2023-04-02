class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to "/books/#{@book.id}"
    else
    @books = Book.all
    render 'index'
    end
  end
  def destroy
    @book = Book.find_by(id: params[:id])
    flash[:notice] = "Book was successfully destroyed."
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end
  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to "/books/#{@book.id}"
    else
     render 'edit'
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title ,:body)
  end
end