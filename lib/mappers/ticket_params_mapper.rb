module Mappers
  class TicketParamsMapper < Dry::Transformer::Pipe
    import Dry::Transformer::ArrayTransformations
    import Dry::Transformer::HashTransformations
    import Dry::Transformer::Recursion

    import :underscore, from: Dry::Inflector.new

    define! do
      hash_recursion do
        map_keys { |key| key.underscore }
      end

      deep_symbolize_keys

      unwrap :excavation_info
      unwrap :date_times
      unwrap :service_area

      unwrap :digsite_info
      rename_keys well_known_text: :digsite_info

      unwrap :additional_service_area_codes
      rename_keys sa_code: :additional_service_area_codes

      unwrap :primary_service_area_code
      rename_keys sa_code: :primary_service_area_code
    end
  end
end
