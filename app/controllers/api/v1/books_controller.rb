class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created, location: api_v1_book_url(@book)
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  def index
    books = Book.all || []
    render json: books
  end

  private

  def set_book
    @book = Article.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :category)
  end
end
