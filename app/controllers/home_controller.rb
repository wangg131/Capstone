class HomeController < ApplicationController
  before_filter :disable_nav, only: [:index]

  def index; end

end
