require "rails_helper"

RSpec.describe Orders::Helpers::SetProductOrders do
  describe "#set_order_values" do
    it "builds ProductOrders on Order" do
      product = create(:product)
      address = create(:address)
      customer = address.user

      expect(user.first_name).to eq("John") 

      # expect(result.post).to eq(post)
      # expect(result.purchaser).to eq(purchaser)
      # expect(result.status).to eq("completed")
      # expect(result.amount_paid).to eq(10.00)
      # expect(result.charge_id).not_to be_nil
    end
  end
end
