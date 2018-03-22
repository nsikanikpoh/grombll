class Catlevel3 < ApplicationRecord
  belongs_to :category, foreign_key: :category_id
  belongs_to :catlevel2, foreign_key: :catlevel2_id
   has_many :companies, as: :sublevel, foreign_key: :sublevel_id
   has_many :grumbles, :through => :companies
end
