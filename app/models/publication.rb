class Publication < ApplicationRecord
  include Filterable

  belongs_to :user
  has_many :solicituds, dependent: :destroy
  validates :dia, presence: true
  validates :salida, presence: true
  validates :dia, presence: true
  validates :hora, length: { is: 5 }
  validates :tipo, inclusion: { in: %w[ida vuelta],
                                message: "%{value} no es ida o vuelta" }
  validates :limite, numericality: { greater_than_or_equal_to: 0 }
  validates :direccion, presence: true
end
