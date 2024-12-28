# == Schema Information
#
# Table name: bookings
#
#  id              :integer          not null, primary key
#  customer_paid   :boolean          default(FALSE)
#  email           :string
#  end_at          :datetime
#  first_name      :string
#  last_name       :string
#  start_at        :datetime
#  status          :integer          default("pending")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  booking_type_id :integer
#
require "test_helper"

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
