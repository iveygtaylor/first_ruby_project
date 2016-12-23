class User < ApplicationRecord
  has_many :tweets

  validates :fname, presence: true
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  scope :today, lambda {where('DATE(created_at) = ?', Date.today)}
  scope :admin, -> { where(email: 'iveygtaylor@gmail.com').first }
end

