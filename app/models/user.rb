class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parts_lists
  has_many :builds

  has_many :likes, dependent: :destroy
  has_many :liked_builds, through: :likes, source: :build

  def has_parts?
    parts_lists.present?
  end

  def has_builds?
    builds.present?
  end
end