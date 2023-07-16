class Book < ApplicationRecord
  belongs_to :library, optional: :true

  validates :status, inclusion: { in: %w[available checked_out] }
  validates :checked_out_by, presence: { if: :checked_out? }

  def checked_out?
    status == 'checked_out'
  end
end