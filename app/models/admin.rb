# frozen_string_literal: true

class Admin < ActiveRecord::Base
  enum role: %i[full_acess restricted_acess]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
