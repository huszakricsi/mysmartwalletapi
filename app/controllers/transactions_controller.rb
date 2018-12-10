class TransactionsController < ApplicationController
  before_action :authenticate_user!
    def getTransactions
      income_category = Category.find_by_label("income")

      render status: 200, json: {'transactions': Transaction.where(user: current_user).map{|transaction| { :id => transaction.id, :amount=> transaction.amount, :comment => transaction.comment, :account_id => transaction.account_id, :category_id => transaction.category_id, :created_at => transaction.created_at, isIncome: income_category.childs.include?(transaction.category) }}}
    end

    def createTransaction
      Transaction.create!(amount: params[:amount], comment: params[:comment], user: current_user, account_id: params[:account_id], category_id: params[:category_id], created_at: params[:created_at])
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
      income_category = Category.find_by_label("income")

      transaction = Transaction.find(params[:id]) #finding our transaction and reverting it's changes on account
      old_acc = transaction.account
      old_category = transaction.category
      if income_category.childs.include?(old_category)
        old_acc.decrement!(:balance, transaction.amount)
      elsif
        old_acc.increment!(:balance, transaction.amount)
      end

      transaction.update(amount: params[:amount],comment: params[:comment],account_id: params[:account_id],category_id: params[:category_id], created_at: params[:created_at]) #updating transaction
      new_acc = transaction.account
      new_category = transaction.category
      if income_category.childs.include?(new_category)
        new_acc.increment!(:balance, params[:amount])
      elsif
        new_acc.decrement!(:balance, params[:amount])
      end
      render status: 200, json: @controller.to_json
    end

    def deleteTransaction
      income_category = Category.find_by_label("income")

      transaction = Transaction.find(params[:id]) #finding our transaction and reverting it's changes on account
      old_acc = transaction.account
      old_category = transaction.category
      if income_category.childs.include?(old_category)
        old_acc.decrement!(:balance, transaction.amount)
      elsif
        old_acc.increment!(:balance, transaction.amount)
      end
      transaction.delete
      render status: 200, json: @controller.to_json
    end
  end