class Procedure < ApplicationRecord
  belongs_to :experiment
  has_many :observations
end
