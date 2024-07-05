class Review < ApplicationRecord
  belongs_to :user
  validates :calificacion, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :contenido, presence: true, length: { minimum: 5 }
end
