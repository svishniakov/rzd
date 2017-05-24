class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_number, on: :create

  scope :sorted, -> (sort_from_head) { sort_from_head ? order(number: :desc) : order(number: :asc) }

  protected

  def set_number
    self.number = train.carriages.count + 1
  end
end
