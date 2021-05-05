module Orders
  module Helpers
    module SetReferenceCode

      def set_reference_code(order = nil)
        order = @order || order # NOTE: added order for separate testing/use case.
        region = order.address.region 
        order.reference_code = find_latest_code(region)
        order.save!
      end

      # NOTE: looks for the latest number then increment

      def find_latest_number(region)
        latest_code = region.orders
          .where("reference_code LIKE ?", "%#{region.code}%")
          .pluck(:reference_code)
          .sort
          .reverse
          &.first || "#{region.code}-0000000000"
        latest_code[3..].to_i + 1   
      end

      def find_latest_code(region)
        latest_number = find_latest_number(region)

        "#{region.code}-#{latest_number.to_s.rjust(10, 0.to_s)}"
      end

    end
  end
end