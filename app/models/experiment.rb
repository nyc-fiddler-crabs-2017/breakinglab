class Experiment < ApplicationRecord
  belongs_to :experimenter, {:class_name => "User"}
  has_one :procedure
  has_many :comments
  has_many :observations
end
