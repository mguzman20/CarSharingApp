class User < ApplicationRecord
  has_many :publications, dependent: :destroy
  has_many :solicituds, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  # attr_accessor :email, :photo
  mount_uploader :photo, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :password, presence: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :username, presence: true, uniqueness: true

  def summary
    "#{name} - #{age} - #{work}"
  end
end
