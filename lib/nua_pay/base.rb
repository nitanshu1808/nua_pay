module NuaPay
  class Base
    def get_response(url, additional_options={}, params={})
    resource =  RestClient::Request.new({
                  method:  additional_options[:request_type] || :get,
                  url:     url,
                  user:    ENV['NUAPAY_API_KEY'],
                  payload: (params.to_json),
                  headers: { content_type: 'application/json'}
                })

      begin
        response = resource.execute
        response && JSON.parse( response )["data"]
      rescue => e
        puts JSON.parse( e.response )
        raise e
      end

    end

    protected
    def build_url( url="" )
      ENV['NUAPAY_BASE_URL'] + url
    end

    def mandate_base_url
      base_url + NUAPAY_API['MANDATES']
    end

    def mandate_url( id )
      build_url( mandate_base_url + id )
    end

    def validate_mandate_params(data)
      data = data.with_indifferent_access.compact
      data.fetch(:debtorAccount).fetch(:iban) && data.fetch(:creditorAccount).fetch(:iban) && data.fetch(:debtor).fetch(:name)
    end

    def base_url
      NUAPAY_API['SCHEMES'] + ENV['NUAPAY_IDENTIFIER']
    end

    def cancellation( reason )
      {"operationReason": reason }
    end

  end
end
