class User < ActiveRecord::Base
  belongs_to :code_school
  validates :email, presence: true
end
