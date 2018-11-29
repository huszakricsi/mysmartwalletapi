# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 15.minutes
  include DeviseTokenAuth::Concerns::User
  has_many :transactions, :class_name => "Transaction"
  has_many :accounts, :class_name => "Account"
end
