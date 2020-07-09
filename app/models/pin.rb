class Pin < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true
    validates :series, presence: true
    validates :price, presence: true
    validates :artist, presence: true
end 