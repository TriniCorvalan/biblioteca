class BooksController < ApplicationController

before_action :set_book, only: %w[show edit update destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

  end

  def new
    @book = Book.new
    @statuses = Book.statuses.keys.to_a
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to root_path}
      else
        format.html {render :new}
      end
    end
  end

  def show
  end

  def edit
    @statuses = Book.statuses.keys.to_a
  end

  def update
    respond_to do |f|
      if @book.save
        f.html {redirect_to root_path}
      else
        f.html {render :edit}
      end
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private 

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :status, :lended_at, :returned_at)
  end
end
