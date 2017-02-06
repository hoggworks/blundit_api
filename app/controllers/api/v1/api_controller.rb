module Api::V1
  class ApiController < ApplicationController
    before_filter :set_default_response_format

    def set_default_response_format
      request.format = :json
    end
  end
end