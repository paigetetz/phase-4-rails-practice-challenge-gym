class Membership < ApplicationRecord
    belongs_to :client
    belongs_to :gym

    validates :gym_id, :client_id, :charge, presence: true
    validates :client_id, uniqueness: { scope: :gym_id }
end
