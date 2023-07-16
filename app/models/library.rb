# app/models/library.rb
class Library < ApplicationRecord
    has_many :books
end
  