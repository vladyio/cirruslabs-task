class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    mapped_ticket = Mappers::TicketParamsMapper.new.call(ticket_params.dup.to_h)
    
    ticket_attrs = mapped_ticket.except(:excavator)
    excavator_attrs = mapped_ticket.fetch(:excavator)
  end

  private

  def ticket_params
    params.require(:ticket).permit(
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
