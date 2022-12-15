# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable, :confirmable

  # Associations
  has_many :recipes, dependent: :destroy
  has_many :foods
  has_many :recipes
  
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

end
