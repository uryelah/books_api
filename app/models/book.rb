class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validate :category_exists

  private

  def category_exists
    if !['action', 'biography', 'history', 'horror', 'kids', 'learning', 'sci-fi'].include? category.downcase
      errors.add(:category, 'It should be on of the default ones')
    end
  end
end
