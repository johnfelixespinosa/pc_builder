class Like < ApplicationRecord
  belongs_to :user
  belongs_to :build, counter_cache: true
end
