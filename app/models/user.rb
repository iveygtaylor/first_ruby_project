class User < ApplicationRecord
  has_many :tweets
  scope :today, lambda {where('DATE(created_at) = ?', Date.today)}
  scope :admin, -> { where(email: 'iveygtaylor@gmail.com').first }
end

