# == Schema Information
#
# Table name: booking_types
#
#  id               :integer          not null, primary key
#  color            :string           default("#000000")
#  duration         :integer
#  location         :string
#  name             :string
#  payment_required :boolean          default(FALSE)
#  price            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_booking_types_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class BookingTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end