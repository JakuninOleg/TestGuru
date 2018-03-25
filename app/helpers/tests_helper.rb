module TestsHelper
  def test_header(test)
    t('.header', title: test.title)
  end
end
