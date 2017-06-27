class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns
  has_many :templates
  has_many :lists
  has_many :contacts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :location, presence: true

  def name
    [first_name, last_name].join(" ")
  end
end
