class TransactionsController < ApplicationController
  before_action :authenticate_user!
    def getTransactions
      render status: 200, json: {'transactions': Transaction.where(user: current_user).map{|transactions| { :id => transactions.id, :amount=> transactions.amount, :comment => transactions.comment, :account_id => transactions.account_id, :category_id => transactions.category_id, :created_at => transactions.created_at }}}
    end
    def createTransaction
      Transaction.create!(amount: params[:amount], comment: params[:comment], user: current_user, account_id: params[:account_id], category_id: params[:category_id])
      acc = Account.find(params[:account_id])
      category = Category.find(params[:category_id])
      income_category = Category.find_by_label("income")
      if income_category.childs.include?(category)
        acc.increment!(:balance, params[:amount])
      elsif
        acc.decrement!(:balance, params[:amount])
      end
      render status: 200, json: @controller.to_json
    end
    def editTransaction
      acc = Transaction.find(params[:id])
      if(acc.user_id == current_user.id)
        acc.balance = params[:balance]
        acc.name = params[:name]
        acc.save     
      end
      render status: 200, json: user_signed_in?
    end
    def deleteTransaction
      acc = Transaction.find(params[:id])
      if(acc.user_id == current_user.id)
        acc.transactions.delete_all
        acc.delete
      end
      render status: 200, json: @controller.to_json
    end
  end