class Observation < ApplicationRecord
  belongs_to :obversable, polymorphic: true
  belongs_to :observer, {:class_name => "User"}
end
