class List < ApplicationRecord
  has_many :positions, dependent: :destroy
  has_many :movies, through: :positions
end
