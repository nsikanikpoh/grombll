class Catlevel1 < ApplicationRecord
  belongs_to :category, foreign_key: :category_id
  has_many :catlevel2s
  has_many :catlevel3s
  has_many :companies, as: :sublevel, foreign_key: :sublevel_id
  has_many :grumbles, :through => :companies
end
