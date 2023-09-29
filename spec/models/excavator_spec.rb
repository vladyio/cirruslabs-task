require "rails_helper"

RSpec.describe Excavator, type: :model do
  describe "associations" do
    it "belongs to a ticket" do
      ticket = create(:ticket)
      excavator = Excavator.new(ticket: ticket)

      expect(excavator.ticket).to eq(ticket)
    end
  end

  describe "validations" do
    it "validates presence of ticket, company_name and address" do
      excavator = Excavator.new

      [:ticket, :company_name, :address].each do |field|
        expect(excavator.valid?).to be_falsey
        expect(excavator.errors[field]).to include("can't be blank")
      end
    end
  end

  describe ".create_with_attrs" do
    let(:ticket) { create(:ticket) }
    let(:attributes) do
      {
        address: "123 Elm Street",
        city: "Springfield",
        state: "IL",
        zip: "12345",
        company_name: "Springfield Construction"
      }
    end

    it "creates an excavator with the concatenated address" do
      excavator = described_class.create_with_attrs(ticket: ticket, **attributes)

      expect(excavator.persisted?).to be true
      expect(excavator.ticket).to eq(ticket)
      expect(excavator.company_name).to eq("Springfield Construction")
      expect(excavator.address).to eq("123 Elm Street, Springfield, IL, 12345")
    end
  end
end
