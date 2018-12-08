class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parts_lists
  has_many :builds

  has_many :likes, dependent: :destroy
  has_many :liked_builds, through: :likes, source: :build

  def has_no_parts?
    parts_lists.empty?
  end

  def has_no_builds?
    builds.empty?
  end

end