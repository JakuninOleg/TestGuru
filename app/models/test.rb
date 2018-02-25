class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :admin

  def self.sorted_category_array(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').
    where(categories: { name: category }).order('tests.title DESC').pluck('title')
  end
end
