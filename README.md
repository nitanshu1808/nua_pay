# NuaPay

Welcome to the nua pay new gem!

This gem provides classes and methods required to operate with
1. Mandate,
2. Direct Debit &
3. Payment Schedule
4. Account


## Installation

In order to install this gem,

include the line

$ gem 'nua_pay', 'version', :git => "https://github.com/nitanshu1808/nua_pay.git"

And then execute:

$ bundle

Or install it yourself as:

$ gem install nua_pay

## Usage

In order to use the, You need to have the following as environment variables that will be provided by the Nua Pay https://nuapay.com

1. NUAPAY_BASE_URL ('Example: https://sandbox.nuapay.com/'),
2. NUAPAY_API_KEY,
3. NUA_PAY_COMPANY_IBAN,
4. NUA_PAY_CREDIT_SCHEME_ID,
5. NUAPAY_IDENTIFIER &
6. NUAPAY_SIGNED_KEY


## Development
1. In order to create a mandate use the following:

* params = '{
   "debtor": {
   "name": "Debtor Name",
   "address": {
     "line1": "Debtor Address Line1",
     "line2": "Debtor Address Line2",
     "town": "Debtor Town",
     "postCode": "123123",
     "state": "Debtor State",
     "country": "IE"
    },
   "language": "en",
   "email": "debtor@email.com",
   "phoneNumber": "0360123123123",
   "mobileNumber": "0360321312312"
   },
   "mandateInfo": {
     "mandateId": "tstMndtAA987",
     "contractReference": "Contract Reference",
     "signatureLocation": "Signature Location",
     "signatureDate": "2015-07-21",
     "electronicSignatureDetails": {
       "authorizationMethod": "SMS_PASSWORD",
       "authorizationToken": "1234",
       "authorizationEmail": "debtor@email.com",
       "authorizationMobileNumber": "0360321312312",
       "ipAddress": "192.168.8.1",
       "geographicLocation": "Geo Location"
     },
     "mandateType": "RCUR"
   },
   "debtorAccount": {
     "iban": "GB94SELN00999976543215",
     "bic": "SELNGB21"
   },
   "creditorAccount": {
     "iban": "GB47SELN00999912345678",
     "bic": "SELNGB21"
   }
 }'

=> NuaPay::MandateInfo.new.create( params )

2. In order to create a direct debit use the following:

* params = '{
    "requestedCollectionDate": "2015-08-12",
    "paymentAmount": 5000.01,
    "endToEndId": "1234567876543234567",
    "remittanceInformation": "Remittance Information",
    "settlementDateShift": true
 }'


NuaPay::DirectDebitInfo.new.create( mandate_identifier, params )

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nitanshu1808]/nua_pay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

