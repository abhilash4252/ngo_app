class Event < ActiveRecord::Base
  belongs_to :organisation
  has_many :participations, dependent: :destroy
  has_many :participants, :through =>  :participations, :source => :user
end
