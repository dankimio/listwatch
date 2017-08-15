class Position < ApplicationRecord
  belongs_to :list, counter_cache: :movies_count
  belongs_to :movie
end
