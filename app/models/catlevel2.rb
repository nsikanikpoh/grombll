class Catlevel2 < ApplicationRecord
  belongs_to :category, foreign_key: :category_id
  belongs_to :catlevel1, foreign_key: :catlevel1_id
  has_many :catlevel3s
  has_many :companies, as: :sublevel, foreign_key: :sublevel_id
  has_many :grumbles, :through => :companies
end
