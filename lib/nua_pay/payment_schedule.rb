class NuaPay::PaymentSchedule < NuaPay

# data = { "paymentFrequency":"DAILY", "paymentType":"FIXED_LENGTH", "startDate":(Date.today + 5.days).strftime, "numberOfPayments":2, "paymentAmount":9.90, "firstPaymentAmount":1.10, "lastPaymentAmount":9.90, "remittanceInformation":"remittanceInformation", "twoPaymentsSamePeriod":true, "settlementDateShift": true }.with_indifferent_access
  def create( mandate_id, data={} )
    validate_post_params( data )
    url = mandate_url( mandate_id ) +  NUAPAY_API['PAYMENT_SCHEDULES']
    get_response( url , {request_type: :post}, data )
  end

# data  =  { "paymentFrequency":"DAILY", "paymentType":"FIXED_LENGTH", "startDate":(Date.today + 5.days).strftime, "numberOfPayments":2, "paymentAmount":9.90, "firstPaymentAmount":1.10, "lastPaymentAmount":9.90, "remittanceInformation":"remittanceInformation", "twoPaymentsSamePeriod":true, "settlementDateShift": true, "mandate": {"debtor": {"name": "Debtor Name"}, "debtorAccount": {"iban": "GB94SELN00999976543215"}, "creditorAccount": {"iban": "GB95SELN00999960724146"} } }

  def create_mandate_with_payment_schedule
    validate_payment_schedule_with_mandate_post_params( data )
    url = build_url( base_url + NUAPAY_API['PAYMENT_SCHEDULES'] )
    get_response( url , {request_type: :post}, data )
  end

  def list
    url = build_url( NUAPAY_API['PAYMENT_SCHEDULES_LIST'] )
    get_response( url )
  end

  def fetch_by_scheme
    url = build_url( base_url + NUAPAY_API['PAYMENT_SCHEDULES'] )
    get_response( url )
  end

  def fetch_by_mandate( mandate_id )
    url = mandate_url( mandate_id )  + NUAPAY_API['PAYMENT_SCHEDULES']
    get_response( url )
  end

  def cancel( mandate_id, id, reason="" )
    url = mandate_url( mandate_id )  + NUAPAY_API['PAYMENT_SCHEDULES'] + id + NUAPAY_API['CANCEL']
    get_response( url , {request_type: :post}, cancellation( reason ) )
  end

  private
  def validate_post_params( data )
    data.fetch(:paymentFrequency) && data.fetch(:paymentType) && data.fetch(:startDate) && data.fetch(:numberOfPayments) && data.fetch(:paymentAmount)
  end

  def validate_payment_schedule_with_mandate_post_params( data )
    mandate = data.fetch(:mandate)
    validate_post_params( data ) && validate_mandate_params( mandate )
  end

end
