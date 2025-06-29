class Team < ApplicationRecord
  belongs_to :department
  has_many :users
end
