class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
    @thinknetica = 'https://thinknetica.com/'
  end

  def author
    @github = 'https://github.com/JakuninOleg'
  end
end
