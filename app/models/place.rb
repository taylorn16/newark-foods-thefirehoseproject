class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :address, presence: true, length: {minimum: 10, maximum: 150}
  validates :description, presence: true, length: {minimum: 10, maximum: 400}
end
