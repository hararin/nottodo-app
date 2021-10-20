class List < ApplicationRecord

  validates :content, exclusion: { in: [nil, ""] }
  validates :detail, exclusion: { in: [nil, ""] }
  validates :isFinished, inclusion: { in: [true, false] }
  validates :patience, numericality: :only_integer
  validate :day_before_today

  def day_before_today
    unless period == nil
      errors.add(:period, 'は、明日以降の日付を入力してください') if period <= Date.today
    end
  end

end
