class StatusController < ApplicationController
    def status
      render json: {'Application Running': true}
    end
  end