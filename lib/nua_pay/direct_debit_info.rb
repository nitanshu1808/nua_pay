# Direct Debit payments allows to pull payments from the borrower's accounts,
# once the borrower has signed an authorisation via signed mandates.
class NuaPay::DirectDebitInfo < NuaPay

  def create( mandate_id, data={} )
    validate_direct_debit_post_params( data )

    url = mandate_url( mandate_id )  + NUAPAY_API['DIRECT_DEBITS']
    get_response( url , {request_type: :post}, data )
  end

  def create_mandate_with_direct_debit(data={})
    validate_direct_debit_with_mandate_post_params( data )
    url = build_url( base_url + NUAPAY_API['DIRECT_DEBITS'] )
    get_response( url , {request_type: :post}, data )
  end

  def get(mandate_id, id )
    url = mandate_url( mandate_id )  + NUAPAY_API['DIRECT_DEBITS'] + id
    get_response( url )
  end

  def list
    url = build_url( NUAPAY_API['DIRECT_DEBITS_LIST'] )
    get_response( url )
  end

  def fetch_by_mandate( mandate_id )
    url = mandate_url( mandate_id )  + NUAPAY_API['DIRECT_DEBITS']
    get_response( url )
  end

  def fetch_by_scheme
    url = build_url( base_url + NUAPAY_API['DIRECT_DEBITS'] )
    get_response( url )
  end

  def revoke( mandate_id, id, reason="" )
    url = mandate_url( mandate_id )  + NUAPAY_API['DIRECT_DEBITS'] + id + NUAPAY_API['REVOKE']
    get_response( url , {request_type: :post}, cancellation( reason ) )
  end

  def revoke_all( mandate_id, reason="" )
    url = mandate_url( mandate_id )  + NUAPAY_API['REVOKE_ALL_DIRECT_DEBITS']
    get_response( url , {request_type: :post}, cancellation( reason ) )
  end

  def represent( mandate_id, id )
    url = mandate_url( mandate_id )  + NUAPAY_API['DIRECT_DEBITS'] + id + NUAPAY_API['REPRESENT']
    get_response( url , {request_type: :post} )
  end

  private
  # requestedCollectionDate should be two days prior to the current date
  def validate_direct_debit_post_params( data )
    _data  = data.with_indifferent_access.compact
    _data.fetch(:requestedCollectionDate) && _data.fetch(:paymentAmount)
  end

  def validate_direct_debit_with_mandate_post_params( data )
    mandate = data.fetch(:mandate)
    validate_direct_debit_post_params( data ) && validate_mandate_params( mandate )
  end
end

