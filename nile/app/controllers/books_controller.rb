class BooksController < ApplicationController
  # the below resue from now applies to all methods of `BooksController` controller , 
  # of course if you want this logic to be applied at an application level you can move the below 
  # `rescue_from` block to the `ApplicationController` along side `not_destroyed` method.
  rescue_from ActiveRecord::RecordNotFound, with: :not_destroyed

  def index
    render json: Book.all
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Book.find(params[:id]).destroy! #the ! at the end returns true

    # since the record is being deleted we only return status code in head.
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end

  def not_destroyed(e)
    render json: { 'error': e }, status: :unprocessable_entity
  end
end
