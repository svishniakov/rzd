class Carriage < ApplicationRecord
  belongs_to :carriage_type
  belongs_to :train

  validates :number, presence: true
end
