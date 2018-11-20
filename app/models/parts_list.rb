class PartsList < ApplicationRecord
  belongs_to :user

  validates :name,             presence: true
  validates :cpu,              presence: true
  validates :cpu_cooler,       presence: true
  validates :motherboard,      presence: true
  validates :storage,          presence: true
  validates :video_card,       presence: true
  validates :case,             presence: true
  validates :power_supply,     presence: true
  validates :operating_system, presence: true
  validates :monitor,          presence: true

end