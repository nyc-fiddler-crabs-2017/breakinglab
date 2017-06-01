class Experiment < ApplicationRecord
  belongs_to :experimenter, {:class_name => "User"}
  belongs_to :proposal
  has_many :procedures
  has_many :comments , as: :commentable
  has_many :observations, as: :observable

  validates :title, presence: true
end
