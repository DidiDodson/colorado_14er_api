class Fourteener < ApplicationRecord
  validates :english_name, presence: true
  validates :elevation, presence: true, numericality: true
end
