class User < ApplicationRecord
  has_many :proposals, {:foreign_key => :proposer_id}
  has_many :experiments, {:foreign_key => :experimenter_id}
  has_many :comments, {:foreign_key => :commenter_id}
  has_many :observations, {:foreign_key => :observer_id}

  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
