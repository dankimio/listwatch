class List < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movies, through: :positions

  def progress(user)
    return 0 if movies_count == 0
    rated_movies_count(user).to_f / movies_count.to_f
  end

  def rated_movies_count(user)
    @rated_movies_count ||= (movie_ids & user.movie_ids).count
  end
end
