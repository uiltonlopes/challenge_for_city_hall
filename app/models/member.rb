class Member < ApplicationRecord

    belongs_to :user
    belongs_to :team
    has_many :meeting_mornings, dependent: :delete_all
    has_many :meeting_afternoons, dependent: :delete_all
    
end
