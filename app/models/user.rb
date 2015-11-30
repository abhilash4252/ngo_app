class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :organisations, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participating_events, :through => :participations, :source => :event
  has_many :created_events, :through => :organisations, :source => :events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
