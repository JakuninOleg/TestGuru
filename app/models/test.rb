class Test < ApplicationRecord
  def self.sorted_tests_array(category)
    Test.select('tests.title, tests.id').joins('JOIN categories ON tests.category_id = categories.id').where('categories.name = ?', category).order('tests.title DESC')
  end
end
