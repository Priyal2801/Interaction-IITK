class Senior < ApplicationRecord
    scope :affiliation_includes, ->(str) {where("array_to_string(tags,',') ILIKE ?", "%#{str}%")}
    has_many :meet 
    has_many :user, through: :meet
    def self.ransackable_scopes(auth_object=nil) 
        [:affiliation_includes]
    end
end
