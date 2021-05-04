# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  first_name             :string
#  last_name              :string
#  is_admin               :boolean          default(FALSE)
#  jti                    :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :addresses 
  has_many :orders, foreign_key: "customer_id", dependent: :destroy, inverse_of: :customer
 
  validates       :email, presence: true
  validates       :password, presence: true, length: { minimum: 6 }
  validates       :first_name, presence: true
  validates       :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
  
end
