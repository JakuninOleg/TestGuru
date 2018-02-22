class Test < ApplicationRecord
  def self.sorted_tests_array(category)
    tests = Test.select('tests.title').
    joins('JOIN categories ON tests.category_id = categories.id').
    where('categories.name = ?', category).order('tests.title DESC').map(&:title)
  end
end
