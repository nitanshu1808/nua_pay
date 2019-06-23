class NuaPay::Account < NuaPay

  def validate_iban( iban )
    url = build_url( NUAPAY_API["IBAN"] + NUAPAY_API["VALIDATE"] )
    get_response( url , {request_type: :post}, {iban: iban} )
  end

  def list(page_num=1, size=10)
    url = build_url( NUAPAY_API["ACCOUNTS"]  + NUAPAY_API["LIST"] )
    get_response( url , {request_type: :post}, {page: {pageNumber: page_num, pageSize: size}} )    
  end

end
