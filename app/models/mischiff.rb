class Mischiff
  include Mongoid::Document

  field :order, type: Integer
  field :className, type: String
  field :title, type: String
  field :description, type: String
  field :rarity, type: String
  field :requiresLeaderboard, type: Boolean
  field :startDate, type: Date
  field :endDate, type: Date
  field :enabled, type: Boolean

end