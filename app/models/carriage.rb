class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  before_create :set_number

  scope :sorted_desc, -> { order(number: :desc) }
  scope :sorted_asc, -> { order(number: :asc) }

  protected

  def set_number
    self.number = train.carriages.count + 1
  end
end
