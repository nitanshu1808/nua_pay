class NuaPay::Scheme < NuaPay

  def get_schemes
    get_response( build_url( NUAPAY_API['SCHEMES'] )  )
  end

  # Don't remove this method as it can be used in the future for fetching
  # scheme identifier from the schemes api
  def get_scheme_identifer
    data = get_schemes.select{|scheme| scheme["creditorSchemeId"] == ENV['NUA_PAY_CREDIT_SCHEME_ID'] }
    if data.blank?
      raise "Credit Scheme ID missing in the schemes"
    else
      data.first["id"]
    end
  end
end
