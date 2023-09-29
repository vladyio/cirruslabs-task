require "rails_helper"

RSpec.describe Ticket, type: :model do
  let(:valid_ticket) { FactoryBot.build(:ticket) }

  context "validations" do
    it "is valid with valid attributes" do
      expect(valid_ticket).to be_valid
    end

    it "is invalid without any of attributes" do
      ticket = Ticket.new
      %i[request_number sequence_number request_type request_action response_due_date_time
        digsite_info additional_service_area_codes primary_service_area_code].each do |field|
        expect(ticket.valid?).to be_falsey
        expect(ticket.errors[field]).to include("can't be blank")
      end
    end
  end
end
