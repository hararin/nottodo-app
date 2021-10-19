class List < ApplicationRecord

  validates :content, exclusion: { in: [nil, ""] }
  validates :detail, exclusion: { in: [nil, ""] }
  validates :isFinished, inclusion: { in: [true, false] }
  validates :patience, numericality: :only_integer
end
