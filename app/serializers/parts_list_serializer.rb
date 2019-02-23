class PartsListSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpu, :cpu_cooler, :motherboard, :ram, :monitor, 
             :storage, :video_card, :case, :power_supply, :operating_system
  has_many :builds
  belongs_to :user
end
