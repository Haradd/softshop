# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @paths = Rails.application.routes.routes.map(&:defaults).select { |x| x[:action] == 'index' }

  end

end
