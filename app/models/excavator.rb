class Excavator < ApplicationRecord
  belongs_to :ticket
  validates_presence_of :ticket, :company_name, :address

  def self.create_with_attrs(ticket:, **attrs)
    concat_address = [attrs[:address], attrs[:city], attrs[:state], attrs[:zip]].join(", ")

    create(ticket: ticket, address: concat_address, company_name: attrs[:company_name])
  end
end
