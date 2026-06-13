class PermitRequest < ApplicationRecord
  belongs_to :user

  validates :dog_name, presence: true
  validates :breed, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :owner_name, presence: true
  validates :owner_phone, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }
  validates :tag_number, uniqueness: true, allow_nil: true
end
