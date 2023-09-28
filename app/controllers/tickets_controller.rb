class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @ticket = ticket_params
    puts Mappers::TicketParamsMapper.new.call(@ticket.dup.to_h)
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
