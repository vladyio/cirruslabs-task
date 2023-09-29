class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  validates_presence_of :request_number, :sequence_number, :request_type,
    :request_action, :response_due_date_time, :digsite_info, :additional_service_area_codes,
    :primary_service_area_code
end
