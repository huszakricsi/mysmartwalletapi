class Account < ApplicationRecord
  belongs_to :currency
  belongs_to :user
  has_many :transactions, :class_name => "Transaction"
end
