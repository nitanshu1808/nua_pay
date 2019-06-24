module NuaPay
  class MandateInfo < Base

    def get( id )
      get_response( mandate_url( id ) )
    end

    def update( id, data={} )
      get_response( mandate_url( id ) , {request_type: :put }, data )
    end

    def create( data={} )
      validate_mandate_params( data )
      get_response( build_url( mandate_base_url ), {request_type: :post}, data )
    end

    def list
      get_response( build_url( mandate_base_url ) )
    end

    def activate( id )
      activation_url = mandate_url( id ) + NUAPAY_API['ACTIVATE']
      get_response( activation_url , {request_type: :post }, {"signatureDate": Date.today.strftime } )
    end

    def cancel( id, reason="" )
      deactivation_url = mandate_url( id ) + NUAPAY_API['CANCEL']
      get_response( deactivation_url , {request_type: :post }, cancellation( reason ) )
    end

  end
end
