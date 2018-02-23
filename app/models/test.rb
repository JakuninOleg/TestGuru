class Test < ApplicationRecord
  def self.sorted_category_array(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').
    where(categories: { name: category }).order('tests.title DESC').pluck('title')
  end
end
