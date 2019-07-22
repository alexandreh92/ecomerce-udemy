# frozen_string_literal: true

class Category < ActiveRecord::Base
  validates_presence_of :description
end
