class Mischiff
  include Mongoid::Document

  field :order, type: Integer
  field :className, type: String
  field :title, type: String
  field :description, type: String
  field :rarity, type: Integer
  field :requiresleaderboard, type: Boolean
  field :startDate, type: Date
  field :endDate, type: Date
  field :enabled, type: Boolean

  validates :order , uniqueness: true, presence: true
  validates :className, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :rarity, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
