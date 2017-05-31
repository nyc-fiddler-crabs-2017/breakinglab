class Observation < ApplicationRecord
  belongs_to :observable, polymorphic: true
  belongs_to :observer, {:class_name => "User"}
  has_many :comments , as: :commentable
end
