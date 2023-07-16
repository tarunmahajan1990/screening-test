require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:library) { Library.create(name: 'Example Library') }

  describe 'validations' do
    it { validates :status, inclusion: { in: %w[available checked_out] } }
    it { validates :checked_out_by, presence: true, if: :checked_out? }
  end
  
  describe 'associations' do
    it { belongs_to :library }
  end

  describe '#checked_out?' do
    let(:book) { Book.new(library: library, title: 'Book 1', author: 'Author 1') }

    it 'returns true if the book is checked out' do
      book.status = 'checked_out'
      expect(book.checked_out?).to be true
    end

    it 'returns false if the book is available' do
      book.status = 'available'
      expect(book.checked_out?).to be false
    end
  end
end
