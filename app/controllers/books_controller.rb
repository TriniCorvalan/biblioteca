class BooksController < ApplicationController

before_action :set_book, only: %w[show edit update destroy]

  def index
  end

  def new
    @book = Book.new
    @statuses = Book.statuses.keys.to_a
  end

  def create
  end

  def show
  end

  def edit
    @statuses = Book.statuses.keys.to_a
  end

  def update
  end

  def destroy
  end

  private 

  def set_book
    @book = Book.find(params[:id])
  end
end
