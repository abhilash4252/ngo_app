class Event < ActiveRecord::Base
  belongs_to :organisation
  has_many :participations, dependent: :destroy
end
