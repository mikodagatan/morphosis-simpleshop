# == Schema Information
#
# Table name: regions
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  code           :string           not null
#  currency       :string           not null
#  tax_percentage :decimal(5, 3)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Region, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
