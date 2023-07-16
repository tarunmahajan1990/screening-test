require 'rails_helper'

RSpec.describe Api::BooksController, type: :controller do
  let(:library) { Library.create(name: 'Example Library') }

  describe 'GET #index' do
    it 'returns a JSON response with book information' do
      book1 = library.books.create(title: 'Book 1', author: 'Author 1', status: 'available')
      book2 = library.books.create(title: 'Book 2', author: 'Author 2', status: 'checked_out', checked_out_by: 'John Doe')

      get :index, params: { library_id: library.id }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['library_id']).to eq(library.id)
      expect(json_response['library_name']).to eq(library.name)

      expect(json_response['books'].length).to eq(2)

      book1_response = json_response['books'][0]
      expect(book1_response['book_id']).to eq(book1.id)
      expect(book1_response['title']).to eq(book1.title)
      expect(book1_response['author']).to eq(book1.author)
      expect(book1_response['status']).to eq(book1.status)
      expect(book1_response['checked_out_by']).to be_nil

      book2_response = json_response['books'][1]
      expect(book2_response['book_id']).to eq(book2.id)
      expect(book2_response['title']).to eq(book2.title)
      expect(book2_response['author']).to eq(book2.author)
      expect(book2_response['status']).to eq(book2.status)
      expect(book2_response['checked_out_by']).to eq(book2.checked_out_by)
    end
  end
end
