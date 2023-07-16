class Api::BooksController < ApplicationController
    def index
        library = Library.find(params[:library_id])
        books = library.books.select(:id, :title, :author, :status, :checked_out_by)

        render json: {
            library_id: library.id,
            library_name: library.name,
            books: books
        }
    end
end
