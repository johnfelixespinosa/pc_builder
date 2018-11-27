class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parts_lists
  has_many :builds

  def has_parts
    !parts_lists.empty?
  end

  def has_builds
    !builds.empty?
  end
  
end
