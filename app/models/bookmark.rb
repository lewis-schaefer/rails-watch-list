class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # validates_uniqueness_of :bookmark_id, scope: [:movie_id, :list_id]
  validates :movie_id, uniqueness: { scope: :list_id }
end
