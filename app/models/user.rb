class User < ApplicationRecord
  include Clearance::User

  include Clearance::User
  has_many :meet 
  has_many :senior, through: :meet
end
