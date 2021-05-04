# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  line1       :string           not null
#  line2       :string
#  city        :string           not null
#  state       :string           not null
#  postal_code :string
#  user_id     :bigint           not null
#  region_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :user
  belongs_to :region
end
