class AccountsController < ApplicationController
  before_action :authenticate_user!
    def getAccounts
      render json: {'accounts': Account.where(user: current_user).map{|account| { :id => account.id, :name=> account.name, :balance => account.balance, :currency => account.currency.iso_code }}}
    end
  end