class Match < ApplicationRecord
  validates :home_country, presence: true
  validates :away_country, presence: true
  validates :home_score, presence: true, numericality: true
  validates :home_penalty, numericality: { only_integer: true }, allow_nil: true
  validates :away_score, presence: true, numericality: true
  validates :away_penalty, numericality: { only_integer: true }, allow_nil: true
  validates :attendance, numericality: true
  validates :venue, presence: true
  validates :round, presence: true
  validates :date, presence: true
  validates :host, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1900, less_than_or_equal_to: Time.current.year }
end
