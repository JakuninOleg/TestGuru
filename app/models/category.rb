class Category < ApplicationRecord
  has_many :tests

  validates :name, presence: true

  default_scope { order(name: :asc) }
end
