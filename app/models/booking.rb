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
class Booking < ApplicationRecord
  has_person_name
  belongs_to :booking_type
  has_rich_text :notes

  validates :start_at, :end_at, :booking_type_id, :name, :email, presence: true

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
