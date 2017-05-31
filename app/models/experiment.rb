class Experiment < ApplicationRecord
  belongs_to :experimenter, {:class_name => "User"}
  belongs_to :procedure
  has_many :comments
  has_many :observations
end
