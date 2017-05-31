class Proposal < ApplicationRecord
  belongs_to :proposer, {:class_name => "User"}
  has_many :comments , as: :commentable
  has_many :experiments
end
