class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :admin

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category) { joins(:category).
    where(categories: { name: category }).order('tests.title DESC') }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.categories_array(category)
    by_category(category).pluck(:title)
  end
end
