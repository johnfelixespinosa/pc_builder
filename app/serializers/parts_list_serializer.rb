class PartsListSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpu, :cpu_cooler, :motherboard, :ram, :monitor, 
             :storage, :video_card, :case, :power_supply, :operating_system, :created_at
  has_many :builds
  belongs_to :user
end
