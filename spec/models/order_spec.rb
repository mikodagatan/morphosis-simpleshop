# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  reference_code :string
#  total          :decimal(14, 2)
#  customer_id    :integer          not null
#  address_id     :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
