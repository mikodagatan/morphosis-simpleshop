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
#  country     :string
#  user_id     :bigint           not null
#  region_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
