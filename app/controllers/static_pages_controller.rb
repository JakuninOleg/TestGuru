class StaticPagesController < ApplicationController
  def home
  end

  def about
    @thinknetica = 'https://thinknetica.com/'
  end

  def author
    @github = 'https://github.com/JakuninOleg'
  end
end
