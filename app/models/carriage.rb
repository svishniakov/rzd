class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  before_validation :carriage_number

  protected

  def carriage_number
    train.carriages.empty? ? self.number = 1 : self.number = train.carriages.maximum(:number) + 1
  end
end
