class Procedure < ApplicationRecord
  belongs_to :experiment
  has_many :observations , as: :observable
end
