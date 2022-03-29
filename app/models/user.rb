class User < ApplicationRecord
    validate :check_password, on: :update
    validates :first_name,presence: true
    validates :password,presence: true, on: :create

    def check_password
        u = User.find_by_id(self.id)
        if self.password != u.password and self.email!=u.email
        errors.add(:base, "Password is incorrect.")
        else
        self.password=u.password
        end
    end
  
end
