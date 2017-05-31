class Observation < ApplicationRecord
  belongs_to :observable, polymorphic: true
  belongs_to :observer, {:class_name => "User"}
end
