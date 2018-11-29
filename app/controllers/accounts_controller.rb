class AccountsController < ApplicationController
  before_action :authenticate_user!
    def getAccounts
      render status: 200, json: {'accounts': Account.where(user: current_user).map{|account| { :id => account.id, :name=> account.name, :balance => account.balance, :currency => account.currency.iso_code }}}
    end
    def createAccount
      Account.create!(name: params[:name], balance: params[:balance], user: current_user, currency: Currency.find_by_iso_code(params[:currency]))
      render status: 200, json: @controller.to_json
    end
    def editAccount
      acc = Account.find(params[:id])
      if(acc.user_id == current_user.id)
        acc.balance = params[:balance]
        acc.name = params[:name]
        acc.save     
      end
      render status: 200, json: user_signed_in?
    end
    def deleteAccount
      acc = Account.find(params[:id])
      if(acc.user_id == current_user.id)
        acc.transactions.delete_all
        acc.delete
      end
      render status: 200, json: @controller.to_json
    end
  end