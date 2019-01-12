# frozen_string_literal: true

class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::StatementInvalid, with: :ransack_search_type_error

  PAGE = 10

  def ransack_search_type_error
    path = request.fullpath
    path = path.slice(0...(path.index('?')))
    flash[:search_error] = 'Inappropriate searching type for this column'
    redirect_to path
  end
end
