class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :email }

  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

    has_many :contact_shares
end
