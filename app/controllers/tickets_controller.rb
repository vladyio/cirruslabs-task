class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    mapped_ticket = Mappers::TicketParamsMapper.new.call(ticket_params.dup.to_h)

    ticket_attrs = mapped_ticket.except(:excavator)
    excavator_attrs = mapped_ticket.fetch(:excavator)

    @ticket = Ticket.create(ticket_attrs)
    @excavator = Excavator.create_with_attrs(ticket: @ticket, **excavator_attrs)
  end

  private

  def ticket_params
    params.permit(
      :RequestNumber,
      :SequenceNumber,
      :RequestType,
      :RequestAction,
      DateTimes: :ResponseDueDateTime,
      ServiceArea: {PrimaryServiceAreaCode: :SACode, AdditionalServiceAreaCodes: {SACode: []}},
      ExcavationInfo: {DigsiteInfo: :WellKnownText},
      Excavator: [:CompanyName, :CrewOnSite, :Address, :City, :State, :Zip]
    )
  end
end
