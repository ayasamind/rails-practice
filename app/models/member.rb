class Member < ActiveRecord::Base
    include EmailAddressChecker
        validates :number, presence: true,
            numericality: { only_integer: true, greater_than: 0, less_than: 100, allow_brank: true },
            uniqueness: true
        
        validates :name, presence: true,
            format: { with: /\A[A-Za-z]\w*\z/, allow_brank: true, message: :invalid_member_name },
                    length: {minumum: 2, maximum: 20, allow_brank: true },#2文字以上20文字以下
                    uniqueness: {case_sensitive: false} #重複を禁止
        
        validates :full_name, length: {maximum: 20}
        
        validate :check_email
        
        private
        def check_email
            if email.present?
                errors.add(:email, :invalid) unless well_formed_as_email_address(email)
            end
        end
    
    class << self    
        def search(query)
            rel = order("number")
            if query.present?
                rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
            end
        rel
        end
    end
end
