class CurrenciesController < ApplicationController
  before_action :authenticate_user!
    def getCurrencies
      render json: {'currencies': Currency.all}
    end
  end