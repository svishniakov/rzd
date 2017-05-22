class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_number

  scope :sorted_desc, -> { order(number: :desc) }
  scope :sorted_asc, -> { order(number: :asc) }

  protected

  def set_number
    logger.info "*" * 50
    logger.info "set_number"
    logger.info train.carriages
    logger.info "*" * 50
    !train.carriages.exists? ? set_first : set_next
  end

  def set_first
    logger.info "*" * 50
    logger.info "set_first"
    logger.info "*" * 50
    self.number = 1
  end

  def set_next
    logger.info "*" * 50
    logger.info "set_next"
    logger.info "*" * 50
    self.number = train.carriages.maximum(:number) + 1
  end
end
