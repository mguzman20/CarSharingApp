class Solicitud < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :descripcion, length: { maximum: 100 }, presence: true
  validates :estado, presence: true, inclusion: { in: %w[true false] }
end
