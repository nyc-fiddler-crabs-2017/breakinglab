class Experiment < ApplicationRecord
  belongs_to :experimenter, {:class_name => "User"}
  belongs_to :proposal
  has_one :procedure
  has_many :comments
  has_many :observations
end
