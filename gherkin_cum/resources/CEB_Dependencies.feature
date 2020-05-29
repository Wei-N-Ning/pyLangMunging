@SPD-3383 @reset-ledger @unused-attributes
Feature: This epic is a mix of multiple stories for different epics that were dependant on Corporate Actions Framework which can now be delivered.

  Background:
    Given this calendar exists:
      | date       | isBusinessDate |
      | 2019-02-19 | Y              |
      | 2019-02-20 | Y              |
      | 2019-02-21 | Y              |
      | 2019-02-22 | Y              |
      | 2019-02-23 | N              |
      | 2019-02-24 | N              |
      | 2019-02-25 | Y              |
      | 2019-02-26 | Y              |
      | 2019-02-27 | Y              |
      | 2019-02-28 | Y              |
      | 2019-03-01 | Y              |
      | 2019-03-02 | N              |
      | 2019-03-03 | N              |
      | 2019-03-04 | Y              |
      | 2019-03-05 | Y              |
      | 2019-03-06 | Y              |
      | 2019-03-07 | Y              |
      | 2019-03-08 | Y              |
      | 2019-03-09 | N              |
      | 2019-03-10 | N              |
      | 2019-03-11 | Y              |
      | 2019-03-12 | Y              |
      | 2019-03-13 | Y              |
      | 2019-03-14 | Y              |
      | 2019-03-15 | Y              |
      | 2019-03-16 | N              |
      | 2019-03-17 | N              |
      | 2019-03-18 | Y              |
      | 2019-03-19 | Y              |
      | 2019-03-20 | Y              |
      | 2019-03-21 | Y              |
      | 2019-03-22 | Y              |
      | 2019-03-23 | N              |
      | 2019-03-24 | N              |
      | 2019-03-25 | Y              |
      | 2019-03-26 | Y              |
      | 2019-03-27 | Y              |
      | 2019-03-28 | Y              |
      | 2019-03-29 | Y              |
      | 2019-03-30 | N              |
      | 2019-03-31 | N              |
      | 2019-04-01 | Y              |
      | 2019-04-02 | Y              |
      | 2019-04-03 | Y              |
      | 2019-04-04 | Y              |
      | 2019-04-05 | Y              |
      | 2019-04-06 | N              |
      | 2019-04-07 | N              |
      | 2019-04-08 | Y              |
      | 2019-04-09 | Y              |
      | 2019-04-10 | Y              |
      | 2019-04-11 | Y              |
      | 2019-04-12 | Y              |
      | 2019-04-13 | N              |
      | 2019-04-14 | N              |
      | 2019-04-15 | Y              |

    And operator is "00001"

    And today is 2019-02-20

    And these entities exist:
      | entityId                            | entityName                     | legalEntityId        |
      | 00000000000000000000000000000000001 | ASX SETTLEMENT PTY LIMITED     | 549300FBHFW3O5LH5M23 |
      | 00000000000000000000000000000000100 | COMMONWEALTH SECURITIES LTD    | 549300JQL1BXTGCCGP12 |
      | 00000000000000000000000000000000200 | COMMONWEALTH TEST 01440        | 549300JQL1BXTGCCGP10 |
      | 00000000000000000000000000000000300 | COMMONWEALTH TEST 01441        | 549300JQL1BXTGCCGP11 |
      | 00000000000000000000000000000000400 | COMMONWEALTH TEST 01443        | 549300JQL1BXTGCCGP13 |
      | 00000000000000000000000000000000500 | COMMONWEALTH TEST 01444        | 549300JQL1BXTGCCGP14 |
      | 00000000000000000000000000000000600 | COMMONWEALTH TEST 01445        | 549300JQL1BXTGCCGP15 |
      | 00000000000000000000000000000000700 | COMMONWEALTH TEST 01445        | 549300JQL1BXTGCCGP16 |
      | 00000000000000000000000000000000201 | Payment Facility Provider      | 549300JQL1BXTGCCGP17 |
      | 00000000000000000000000000000001000 | BITCOIN PAYMENT PROVIDER 01500 | 549300JQL1BXTGCCGP22 |

    And these actors exist:
      | actorId | entityId                            | messagingPreference | bic         |
      | 00005   | 00000000000000000000000000000000001 | UICMessaging        |             |
      | 01440   | 00000000000000000000000000000000200 | UICMessaging        | ABCDEF40    |
      | 01441   | 00000000000000000000000000000000300 | UICMessaging        | ABCDEF41    |
      | 01442   | 00000000000000000000000000000000100 | UICMessaging        | ABCDEF42    |
      | 01443   | 00000000000000000000000000000000400 | UICMessaging        | ABCDEF43    |
      | 01444   | 00000000000000000000000000000000500 | UICMessaging        | ABCDEF44    |
      | 01445   | 00000000000000000000000000000000600 | UICMessaging        | ABCDEF45    |
      | 01446   | 00000000000000000000000000000000700 | BICMessaging        | ABCDEF46    |
      | 01402   | 00000000000000000000000000000000200 | UICMessaging        | ABCDEF4790A |
      | 01606   | 00000000000000000000000000000000201 | UICMessaging        | ABCDEF4890A |
      | 01500   | 00000000000000000000000000000001000 | UICMessaging        | ABCDEF50111 |

    And these issuers exist:
      | entityName | entityId                            | alternativeIds_arbn | alternativeIds_arsn | alternativeIds_abn | alternativeIds_acn | incorporationCode | actorId | issuerId | issuerCode | fullName   | abbreviatedName | shortName | listingStatus | foreignListingType | lastActiveDate | loanSecuritiesIndicator | financeNumber | status |
      | CBA Issuer | 00000000000000000000000000000002001 |                     |                     | 49004028077        |                    | LimitedLiability  | 75001   | 4173     | CBA        | CBA Issuer | CBA Bank        | CBA       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | WBC Issuer | 00000000000000000000000000000002002 |                     |                     | 49004028078        |                    | LimitedLiability  | 75002   | 4179     | WBC        | WBC Issuer | WBC Bank        | WBC       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | ANZ Issuer | 00000000000000000000000000000002003 |                     |                     | 49004028079        |                    | LimitedLiability  | 75003   | 4174     | ANZ        | ANZ Issuer | ANZ Bank        | ANZ       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | VAR Issuer | 00000000000000000000000000000002004 |                     |                     | 49004028080        |                    | LimitedLiability  | 75004   | 4175     | VAR        | VAR Issuer | VAR             | VAR       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | IOO Issuer | 00000000000000000000000000000002005 |                     |                     | 49004028081        |                    | LimitedLiability  | 75005   | 4176     | IOO        | IOO Issuer | IOO             | IOO       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | BHP Issuer | 00000000000000000000000000000002006 |                     |                     | 49004028082        |                    | LimitedLiability  | 55000   | 4177     | BHP        | BHP Issuer | BHP             | BHP       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |
      | WOW Issuer | 00000000000000000000000000000002007 |                     |                     | 49004028083        |                    | LimitedLiability  | 75006   | 4178     | WOW        | WOW Issuer | WOW             | WOW       | Listed        | Domestic           | 2018-12-12     | N                       | 123456        | Active |

    And these securities exist:
      | isin         | securityId | securityCode | firstListedDate | classification | firstSettlementDate | expiryDate | deferredDelivery | lastListedDate | issuerActorId | state     | listedStatusType | securityTypeCode | currency | chessEligible | nettingEligible | issuerSponsoredSubRegistry | descriptionAbbreviated | descriptionShort | descriptionLong | apirCode |
      | AU0000CBA123 | 123        | CBA          | 1972-06-14      | Equity         |                     |            | N                | 2072-06-14     | 75001         | Open      | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | CBA                    | CBA              | CBA             |          |
      | AU0000WBC124 | 124        | WBC          | 1972-06-14      | Equity         | 2018-08-05          |            | N                | 2072-06-14     | 75002         | Suspended | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | WBC                    | WBC              | WBC             |          |
      | AU00000ANZ25 | 125        | ANZ          | 1972-06-14      | MFund          |                     |            | N                | 2072-06-14     | 75003         | Open      | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | ANZ                    | ANZ              | ANZ             |          |
      | AU0000WOW126 | 126        | WOW          | 1972-06-14      | Equity         |                     |            | N                | 2072-06-14     | 75006         | Open      | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | WOW                    | WOW              | WOW             |          |
      | AU0000QAN126 | 200        | QAN          | 2018-08-01      | Equity         | 2018-08-01          |            | N                | 2072-06-14     | 55000         | Closed    | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | QAN                    | QAN              | QAN             |          |
      | AU0000IOO126 | 201        | IOO          | 2018-08-01      | Equity         | 2018-08-01          |            | N                | 2072-06-14     | 75005         | Archived  | QuotedTradable   | Ordinary         | AUD      | Y             | Y               | Y                          | IOO                    | IOO              | IOO             |          |
      | AU0000000642 | 642        | BHP          | 2018-08-01      | Equity         |                     |            | N                | 2072-06-14     | 55000         | Open      | QuotedTradable   | Rights           | AUD      | Y             | Y               | Y                          | BHP                    | BHP              | BHP             | 12345    |
    #      | AU0000ZZA126 |   127      | ZZA          | 2018-08-01      | Equity         | 2018-08-03          |            | N                | 2072-06-14     | 4180     | Open      | 0                | Ordinary           | AUD      | Y             | Y               | Y                          | ZZA                    | ZZA              | ZZA             |          |
    #      | AU0000ZZB126 | 128        | ZZB          | 2018-08-01      | Equity         | 2018-08-03          |            | N                | 2072-06-14     | 2348     | Open      | 4                | Ordinary           | AUD      | Y             | Y               | Y                          | ZZB                    | ZZB              | ZZB             |          |
    #      | AU0000ZZC126 | 129        | ZZC          | 2018-08-01      | Equity         | 2018-08-03          |            | N                | 2072-06-14     | 2348     | Open      | 0                | AllocationInterest | AUD      | Y             | Y               | Y                          | ZZC                    | ZZC              | ZZC             |          |

    And these roles exist:
      | actorId | roleCode             | permissionTypes                                                                      | settlementFacility | status   | transferRelationshipRoleData |
      | 00005   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01440   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01441   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01442   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01443   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01444   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01445   | SettlementFacility   |                                                                                      |                    | Active   |                              |
      | 01402   | PaymentProvider      |                                                                                      |                    | Active   |                              |
      | 01606   | PaymentProvider      |                                                                                      |                    | Active   |                              |
      | 01440   | BatchSettlement      |                                                                                      | 00005              | Active   |                              |
      | 01441   | BatchSettlement      |                                                                                      | 00005              | Active   |                              |
      | 01442   | BatchSettlement      |                                                                                      | 00005              | Active   |                              |
      | 01443   | BatchSettlement      |                                                                                      | 00005              | Active   |                              |
      | 01444   | BatchSettlement      |                                                                                      | 00005              | Disabled |                              |
      | 01445   | BatchSettlement      |                                                                                      | 00005              | Disabled |                              |
      | 01442   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01440   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01441   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01443   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01444   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01445   | AccountCreator       | SponsoredAccount;DirectAccount;SettlementEntrepotAccount;AccumulationEntrepotAccount |                    | Active   |                              |
      | 01443   | TransferRelationship |                                                                                      |                    | Active   | 01440                        |
      | 01440   | BasicParticipant     |                                                                                      |                    | Active   |                              |
      | 01441   | BasicParticipant     |                                                                                      |                    | Active   |                              |
      | 01442   | BasicParticipant     |                                                                                      |                    | Active   |                              |
      | 01443   | BasicParticipant     |                                                                                      |                    | Active   |                              |
      | 01500   | PaymentProvider      |                                                                                      |                    | Active   |                              |

    And these accounts-holders exist:
      | actorId | accountId  | accountType                 | residencyIndicator | communicationPreference | address_adrLines_0 | address_townName | address_postalCode | address_countrySubDivision | address_countryCode | status | createdAt               | holder_0_name | holder_0_holderType | holder_0_status | mailingAddresseeLine | designation | address_adrLines_1 | address_adrLines_2 | email | holder_0_actorId | holder_0_address_addressType | holder_0_address_adrLines_0 | holder_0_address_adrLines_1 | holder_0_address_adrLines_2 | holder_0_address_adrLines_3 | holder_0_address_adrLines_4 | holder_0_address_countryCode | holder_0_address_countrySubDivision | holder_0_address_postalCode | holder_0_address_townName | holder_0_companyDetails_incorporationDate | holder_0_companyDetails_legalEntityId | holder_0_email | holder_0_holderId     | holder_0_individualDetails_dateOfBirth | holder_0_taxInformation_residency | holder_0_taxInformation_taxId | holder_0_mobile | accountName |
      | 01440   | 0010000007 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Who      | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0011178900} |                                        |                                   |                               |                 |             |
      | 01440   | 0010000008 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John What     | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0034567890} |                                        |                                   |                               |                 |             |
      | 01441   | 0010000015 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Knows    | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678901} |                                        |                                   |                               |                 |             |
      | 01442   | 0010000023 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Boothe   | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678902} |                                        |                                   |                               |                 |             |
      | 01442   | 0010000024 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Bathe    | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678903} |                                        |                                   |                               |                 |             |
      | 01443   | 0010000031 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Forgets  | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678904} |                                        |                                   |                               |                 |             |
      | 01444   | 0010000040 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Lost     | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678905} |                                        |                                   |                               |                 |             |
      | 01445   | 0010000058 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Citizen  | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678906} |                                        |                                   |                               |                 |             |
      | 01441   | 0010000100 | DirectAccount               | Mixed              |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Mixingit | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678907} |                                        |                                   |                               |                 |             |
      | 01442   | 0010021442 | AccumulationEntrepotAccount | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Fletcher | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678908} |                                        |                                   |                               |                 |             |
      | 01443   | 0010001443 | SponsoredAccount            | Domestic           | Post                    | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John English  | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678909} |                                        |                                   |                               |                 |             |
      | 01444   | 0010001444 | DirectAccount               | Domestic           | Post                    | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Gottman  | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678910} |                                        |                                   |                               |                 |             |
      | 01445   | 0010001445 | DirectAccount               | Domestic           |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Hitchens | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678911} |                                        |                                   |                               |                 |             |
      | 01441   | 0010021441 | DirectAccount               | Foreign            |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Fortwo   | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678912} |                                        |                                   |                               |                 |             |
      | 01440   | 0010021440 | DirectAccount               | Foreign            |                         | 1 George St        | Sydney           | 2000               | NSW                        | AU                  | Active | 2018-08-02T10:10:10.00Z | John Foreign  | Company             | Active          |                      |             |                    |                    |       |                  |                              |                             |                             |                             |                             |                             |                              |                                     |                             |                           |                                           |                                       |                | {holder:id0045678913} |                                        |                                   |                               |                 |             |

    And these payment-facilities exist:
      | paymentFacilityId | paymentProviderId | paymentManagerId | facilityType | status | accountIds |
      | 000234            | 01606             | 01442            | Nominated    | Active |            |
      | 000235            | 01402             | 01441            | Nominated    | Active |            |
      | 000236            | 01402             | 01442            | Nominated    | Active |            |
      | 000238            | 01402             | 01444            | Nominated    | Active |            |
      | 000239            | 01402             | 01445            | Nominated    | Active |            |

    And these holdings exist:
      | accountId  | securityId | units |
      | 0010000007 | 123        | 100   |
      | 0010000007 | 642        | 100   |
      | 0010000007 | 124        | 100   |
      | 0010000008 | 123        | 100   |
      | 0010000008 | 642        | 100   |
      | 0010000015 | 123        | 200   |
      | 0010000023 | 123        | 300   |
      | 0010000023 | 126        | 500   |
      | 0010000024 | 126        | 1000  |
      | 0010000031 | 124        | 400   |
      | 0010000040 | 123        | 500   |
      | 0010000058 | 123        | 600   |

    And ASX operator is set up

    And bdrnMessageId is "{party:scheduler}|XYZ781"

    #
    # Set up payment facilities
    #

    And paymentProviderId is "01500"
    And bdspAccount is "BSBAccount001"
    And bdsrAccount is "BSBAccount002"
    And paymentProviderBIC is "ABCDEF50111"
    And paymentProviderName is "BITCOIN PAYMENT PROVIDER 01500"

    # Fields to fill in for "create account specific payfac" are:
    # TransactionId, PayFacSubTypes, PaymentManagerId, AccountIds
    And "create account specific payfac" table contains:
      | RequestType                       | OPEN                |
      | PayFacId                          |                     |
      | PayFacType                        | ACCT                |
      | AccountIds                        |                     |
      | PayFacStatus                      | ENAB                |
      | PayFacSubTypes                    | BDSP;BDSR           |
      | EffectiveDate                     | 2019-02-20          |
      | PayFacChangeReason                |                     |
      | PayProviderId                     | {paymentProviderId} |
      | BilateralDemandPayerAccount       | {bdspAccount}       |
      | BilateralDemandReceiverAccount    | {bdsrAccount}       |
      | CorporateActionEntitlementAccount |                     |
      | NewPayProviderId                  |                     |

    # Fields to fill in for "create account specific payfac ack" are:
    #   OriginTransactionId, PayFacId*, PayFacSubTypes, AccountHIN,
    #   PaymentManagerUIC, PaymentManagerBIC, PaymentManagerName
    # You should capture the PayFacId with something like
    #   {CAPTURE:payFacId1}
    And "create account specific payfac ack" table contains:
      | TransactionId                     | {IGNORE}              |
      | CrDtTm                            | {IGNORE}              |
      | EffectiveDate1                    | {IGNORE}              |
      | EffectiveDate2                    | {IGNORE}              |
      | RequestType                       | OPEN                  |
      | PayFacType                        | ACCT                  |
      | AccountHIN                        |                       |
      | PayFacStatus                      | ENAB                  |
      | PayProviderId                     | {paymentProviderId}   |
      | PaymentProviderName               | {paymentProviderName} |
      | PaymentProviderBIC                | {paymentProviderBIC}  |
      | BilateralDemandPayerAccount       | {bdspAccount}         |
      | BilateralDemandReceiverAccount    | {bdsrAccount}         |
      | CorporateActionEntitlementAccount |                       |

    # Setting up First PayFac
    # TODO:SS: When the new loader becomes available use it!
    And payFacMessageId1 is "{party:uiOps}\|{XEGER:\\d\{25\}}"
    And paymentManagerId1 is "01440"
    And paymentManagerBIC1 is "ABCDEF40"
    And paymentManagerName1 is "COMMONWEALTH TEST 01440"

    And "{party:uiOps}" sends a "BMW/inte918" message with values merged with "create account specific payfac":
      | TransactionId    | {payFacMessageId1}    |
      | PayFacSubTypes   | BATC;BDSP;BDSR        |
      | PaymentManagerId | {paymentManagerId1}   |
      | AccountIds       | 0010000007;0010000008 |

    And "{party:uiOps}" should receive a "BMW/acct004" a message with values merged with "create account specific payfac ack":
      | OriginTransactionId | {payFacMessageId1}    |
      | PayFacId            | {CAPTURE:payFacId1}   |
      | PayFacSubTypes      | BATC;BDSP;BDSR        |
      | PaymentManagerBIC   | {paymentManagerBIC1}  |
      | PaymentManagerUIC   | {paymentManagerId1}   |
      | PaymentManagerName  | {paymentManagerName1} |
      | AccountHIN          | 0010000007;0010000008 |

    And "{paymentManagerId1}" should receive a "BMW" message with schema location matching "acct_004"
    And "{paymentProviderId}" should receive a "BMW" message with schema location matching "acct_004"

    # Setting up Second Payment Facility
    # TODO:SS: When the new loader becomes available use it!
    And payFacMessageId2 is "{party:uiOps}\|{XEGER:\\d\{25\}}"
    And paymentManagerId2 is "01441"
    And paymentManagerBIC2 is "ABCDEF41"
    And paymentManagerName2 is "COMMONWEALTH TEST 01441"

    And "{party:uiOps}" sends a "BMW/inte918" message with values merged with "create account specific payfac":
      | TransactionId    | {payFacMessageId2}  |
      | PayFacSubTypes   | BDSP;BDSR           |
      | PaymentManagerId | {paymentManagerId2} |
      | AccountIds       | 0010000015          |

    And "{party:uiOps}" should receive a "BMW/acct004" a message with values merged with "create account specific payfac ack":
      | OriginTransactionId | {payFacMessageId2}    |
      | PayFacId            | {CAPTURE:payFacId2}   |
      | PayFacSubTypes      | BDSP;BDSR             |
      | PaymentManagerBIC   | {paymentManagerBIC2}  |
      | PaymentManagerUIC   | {paymentManagerId2}   |
      | PaymentManagerName  | {paymentManagerName2} |
      | AccountHIN          | 0010000015            |

    And "{paymentManagerId2}" should receive a "BMW" message with schema location matching "acct_004"
    And "{paymentProviderId}" should receive a "BMW" message with schema location matching "acct_004"


  Scenario Outline: <AC> - Unilateral Demand Transfer NACK (01 - 07 AC) Determine Basis of Movement and Effect Cum Entitlement Balance - <Description>
    Given requester is "01440"
    And receiverActorUDTR is "01440"
    And receiverActorUDRP is "01443"
    And messageId is "{requester}|11111111111111111111111111111"
    And schedulerMessageId1 is "{party:scheduler}|XYZ781"
    And transactionId is "{requester}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And deliverer is "0010000007"
    And receiverUDTR is "0010021440"
    And receiverUDRP is "0010000031"
    And supplementaryRef is "TRF600"
    And participantRef is "/PRTY/TRF600"
    And underlyingRef is "/UNDR/TRF600"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And transactionCondition is "UDTR"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21


    When "{requester}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId}            |
      | TransactionId     | {transactionId}        |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | 50                     |
      | DeliveringHIN     | {deliverer}            |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | <TransactionCondition> |
      | DeliveringActorId | {requester}            |
      | ReceivingActorId  | <ReceiverActor>        |
      | ReceivingHIN      | <Receiver>             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{requester}" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {messageId}          |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-1357
    Examples:
      | AC            | TransactionCondition | Receiver       | ReceiverActor       | ReceiverBalance               | OverrideBOMs   | Reject Reason | Reject Description                                                                                    | Description                                                                                             |
      | SPD-1357-AC01 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} |                | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN                           |
      | SPD-1357-AC02 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CBNS,CDIV,CCRT | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, oBOM provided as 'cum' and insufficient CEB Units available in Delivering HIN                     |
      | SPD-1357-AC03 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CDIV,CDIV,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CDIV' value is invalid              | Nack, two or more Override Basis of Movement                                                            |
      | SPD-1357-AC04 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CDIV,XDIV,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'XDIV' value is invalid              | Nack, two or more Override Basis of Movement with the same final three letters                          |
      | SPD-1357-AC05 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CBNS,CINT,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CINT' value is invalid              | Nack, One or more Override Basis of Movement do not correspond to the BOM Type of a Corporate Action Id |
      | SPD-1357-AC06 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CBNS,CXXX,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CXXX' value is invalid              | Nack, isn't a valid BOM Code on the BOQ/BOM Table                                                       |
      | SPD-1357-AC07 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CBNS,CDIV      | 1144          | Additional instances of /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id are expected | Nack, There are less Override Basis of Movement than Corporate Action Ids                               |
      | SPD-1357-AC01 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               |                | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN                           |
      | SPD-1357-AC02 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CBNS,CDIV,CCRT | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, oBOM provided as 'cum' and insufficient CEB Units available in Delivering HIN                     |
      | SPD-1357-AC03 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CDIV,CDIV,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CDIV' value is invalid              | Nack, two or more Override Basis of Movement                                                            |
      | SPD-1357-AC04 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CDIV,XDIV,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'XDIV' value is invalid              | Nack, two or more Override Basis of Movement with the same final three letters                          |
      | SPD-1357-AC05 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CBNS,CINT,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CINT' value is invalid              | Nack, One or more Override Basis of Movement do not correspond to the BOM Type of a Corporate Action Id |
      | SPD-1357-AC06 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CBNS,CXXX,CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CXXX' value is invalid              | Nack, isn't a valid BOM Code on the BOQ/BOM Table                                                       |
      | SPD-1357-AC07 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CBNS,CDIV      | 1144          | Additional instances of /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id are expected | Nack, There are less Override Basis of Movement than Corporate Action Ids                               |


  Scenario Outline: <AC> SchemaValidation — RegEx in Reject Description for the field with invalid BIC is incorrect
    Given requester is "01440"
    And receiverActorUDTR is "01440"
    And receiverActorUDRP is "01443"
    And messageId is "{requester}|11111111111111111111111111111"
    And schedulerMessageId1 is "{party:scheduler}|XYZ781"
    And transactionId is "{requester}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And deliverer is "0010000007"
    And receiverUDTR is "0010021440"
    And receiverUDRP is "0010000031"
    And supplementaryRef is "TRF600"
    And participantRef is "/PRTY/TRF600"
    And underlyingRef is "/UNDR/TRF600"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And transactionCondition is "UDTR"

    And today is 2019-02-21

    When "{requester}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr         | {messageId}            |
      | TransactionId        | {transactionId}        |
      | SttlmtDt             | 2019-02-21             |
      | SecurityRefCode      | {securityRefCode}      |
      | SettlmQty            | 50                     |
      | DeliveringHIN        | {deliverer}            |
      | TransactionBasis     | {transactionBasis}     |
      | SttlmTxCond          | {transactionCondition} |
      | DeliveringActorBICId | {requester}            |
      | ReceivingActorId     | {receiverActorUDTR}    |
      | ReceivingHIN         | {receiverUDTR}         |
      | SupplementaryRef     | {supplementaryRef}     |
      | ParticipantRef       | {participantRef}       |
      | UnderlyingRef        | {underlyingRef}        |

    Then "{requester}" should receive a "BMW/comm807" message with values:
      | RelatedReference  | {messageId}          |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-4262
    Examples:
      | AC             | Reject Reason | Reject Description                                                                                                                                                                       |
      | SPD-4262-ACBug | 0099          | /BizMsg/Document/SctiesSttlmTxInstr/DlvrgSttlmPties/Pty1/Id/AnyBIC: Text field does not match pattern. Actual text '01440'. Pattern '[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}'. |


  Scenario Outline: <AC> - <TransactionCondition> - Unilateral Demand Transfer ACK (08 & 10 AC) Determine Basis of Movement and Effect Cum Entitlement Balance - <Description>
    Given requester is "01440"
    And receiverActorUDTR is "01440"
    And receiverActorUDRP is "01443"
    And messageId is "{requester}|11111111111111111111111111111"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And transactionId is "{requester}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And deliverer is "0010000007"
    And receiverUDTR is "0010021440"
    And receiverUDRP is "0010000031"
    And supplementaryRef is "TRF200"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF300"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And transferAmount is "40.0"
    And transferAmountNoDecimal is "40"
    And delivererUnitsBefore is "100.00000000000000000"
    And delivererUnitsAfter is "60.00000000000000000"
    And delivererUnitsAfterNoDecimal is "60"
    And receiverUnitsAfter is "40.00000000000000000"
    And receiverUnitsAfterNoDecimal is "40"
    And determinedBOMs is "CBNS,CCRT,CDIV"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21


    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | ACCP                     |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp1}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00700             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp2}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00703             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp3}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00706             |

    And "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    When "{requester}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId}            |
      | TransactionId     | {transactionId}        |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {transferAmount}       |
      | DeliveringHIN     | {deliverer}            |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | <TransactionCondition> |
      | DeliveringActorId | {requester}            |
      | ReceivingActorId  | <ReceiverActor>        |
      | ReceivingHIN      | <Receiver>             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{requester}" should receive a "BMW/hold202" message with values:
      | relatedFromUic    | {requester}                    |
      | relatedToUic      | {party:operator}               |
      | relatedBizMsgIdr  | {messageId}                    |
      | AccountOwnerTxId  | {transactionId}                |
      | SupplementaryRef  | {supplementaryRef}             |
      | ParticipantRef    | {participantRef}               |
      | UnderlyingRef     | {underlyingRef}                |
      | ISIN              | AU0000CBA123                   |
      | EffectiveSttlmtDt | 2019-02-21                     |
      | SecurityCode      | {securityRefCode}              |
      | SettlmQty         | {transferAmountNoDecimal}      |
      | AccountHIN        | {deliverer}                    |
      | TransactionBasis  | {transactionBasis}             |
      | SttlmTxCond       | <TransactionCondition>         |
      | DeliveringActorId | {requester}                    |
      | ReceivingActorId  | <ReceiverActor>                |
      | CounterPartyHIN   | <Receiver>                     |
      | DlvrgHldgBal      | {delivererUnitsAfterNoDecimal} |
      | RcvgHldgBal       | <ReceiverBalance>              |
      | ObligationId      | {REGEX:[a-f0-9]\{32\}}         |
      | OverrideBOMs      | {determinedBOMs}               |

    # For the UDRP transfers we ignore the hold202 for the ReceiverActor

    Then "{requester}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{sp1}"
    Then "{requester}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{sp2}"
    And  "{requester}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{sp3}"

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty  | AccountId   | UnitQuantity          | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsAfter} | 00700             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty  | AccountId   | UnitQuantity          | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsAfter} | 00703             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty  | AccountId   | UnitQuantity          | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsAfter} | 00706             |

    And "<ReceiverActor>" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity         | CorporateActionId |
      | <ReceiverActor> | <Receiver> | {receiverUnitsAfter} | 00700             |

    And "<ReceiverActor>" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity         | CorporateActionId |
      | <ReceiverActor> | <Receiver> | {receiverUnitsAfter} | 00703             |

    And "<ReceiverActor>" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity         | CorporateActionId |
      | <ReceiverActor> | <Receiver> | {receiverUnitsAfter} | 00706             |

    @SPD-1357
    Examples:
      | TransactionCondition | Receiver       | ReceiverActor       | ReceiverBalance               | OverrideBOMs | AC            | Description                                                              |
      #      | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} | CBNS,CDIV,CCRT | SPD-1357-AC08 | CEB Balances are transferred. Override Basis of Movement is provided.    |
      | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} |              | SPD-1357-AC10 | CEB Balances are transferred. No Override Basis of Movement is provided. |
  #      | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               | CBNS,CDIV,CCRT | SPD-1357-AC08 | CEB Balances are transferred. Override Basis of Movement is provided.    |
  #      | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               |                | SPD-1357-AC10 | CEB Balances are transferred. No Override Basis of Movement is provided. |


  Scenario Outline: <AC> - <TransactionCondition> - Unilateral Demand Transfer ACK (09 AC) Determine Basis of Movement and Effect Cum Entitlement Balance

    Given requester is "01440"
    And receiverActorUDTR is "01440"
    And receiverActorUDRP is "01443"
    And messageId is "{requester}|11111111111111111111111111111"
    And messageId2 is "<ReceiverActor>\|22222222222222222222222222222"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And transactionId is "{requester}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And transactionId2 is "<ReceiverActor>\|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And deliverer is "0010000007"
    And receiverUDTR is "0010021440"
    And receiverUDRP is "0010000031"
    And supplementaryRef is "TRF200"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF300"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And transferAmount is "30.0"
    And transferAmountNoDecimal is "30"
    And delivererUnitsBefore is "100.00000000000000000"
    And delivererUnitsAfter is "70.00000000000000000"
    And delivererUnitsAfterNoDecimal is "70"
    And receiverUnitsAfter is "30.00000000000000000"
    And receiverUnitsAfterNoDecimal is "30"
    And determinedBOMs is "CDIV,XBNS,XCRT"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | ACCP                     |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp1}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00700             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp2}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00703             |

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp3}" and values:
      | ActorParty  | AccountId   | UnitQuantity           | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsBefore} | 00706             |

    And "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{requester}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId}            |
      | TransactionId     | {transactionId}        |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {transferAmount}       |
      | DeliveringHIN     | {deliverer}            |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | <TransactionCondition> |
      | DeliveringActorId | {requester}            |
      | ReceivingActorId  | <ReceiverActor>        |
      | ReceivingHIN      | <Receiver>             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | XBNS,CDIV,XCRT         |

    And "{requester}" should receive a "BMW/hold202" message with values:
      | relatedFromUic    | {requester}                    |
      | relatedToUic      | {party:operator}               |
      | relatedBizMsgIdr  | {messageId}                    |
      | AccountOwnerTxId  | {transactionId}                |
      | SupplementaryRef  | {supplementaryRef}             |
      | ParticipantRef    | {participantRef}               |
      | UnderlyingRef     | {underlyingRef}                |
      | ISIN              | AU0000CBA123                   |
      | EffectiveSttlmtDt | 2019-02-21                     |
      | SecurityCode      | {securityRefCode}              |
      | SettlmQty         | {transferAmountNoDecimal}      |
      | AccountHIN        | {deliverer}                    |
      | TransactionBasis  | {transactionBasis}             |
      | SttlmTxCond       | <TransactionCondition>         |
      | DeliveringActorId | {requester}                    |
      | ReceivingActorId  | <ReceiverActor>                |
      | CounterPartyHIN   | <Receiver>                     |
      | DlvrgHldgBal      | {delivererUnitsAfterNoDecimal} |
      | RcvgHldgBal       | <ReceiverBalance>              |
      | ObligationId      | {REGEX:[a-f0-9]\{32\}}         |
      | OverrideBOMs      | {determinedBOMs}               |

    Then "{requester}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{sp2}"

    And "{requester}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty  | AccountId   | UnitQuantity          | CorporateActionId |
      | {requester} | {deliverer} | {delivererUnitsAfter} | 00703             |

    And "<ReceiverActor>" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity         | CorporateActionId |
      | <ReceiverActor> | <Receiver> | {receiverUnitsAfter} | 00703             |

    When "<ReceiverActor>" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId2}           |
      | TransactionId     | {transactionId2}       |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {transferAmount}       |
      | DeliveringHIN     | <Receiver>             |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | <TransactionCondition> |
      | DeliveringActorId | <ReceiverActor>        |
      | ReceivingActorId  | {requester}            |
      | ReceivingHIN      | {deliverer}            |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |

    Then "<ReceiverActor>" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {messageId2}                                                             |
      | RejectionReason   | 1084                                                                     |
      | ReasonDescription | Requested quantity is greater than the available balance in '<Receiver>' |

    @SPD-1357
    Examples:
      | AC            | TransactionCondition | Receiver       | ReceiverActor       | ReceiverBalance               |
      | SPD-1357-AC09 | UDTR                 | {receiverUDTR} | {receiverActorUDTR} | {receiverUnitsAfterNoDecimal} |
      | SPD-1357-AC09 | UDRP                 | {receiverUDRP} | {receiverActorUDRP} |                               |

  # Feature for Bilateral Demand Transfers
  # Validate oBOM and CEB

  Scenario Outline: <AC> - Bilateral Demand Transfer Nack Determine Basis of Movement and Effect Cum Entitlement Balance <Description>
    Given these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | acceleratedOfferType    | buyBackType | intermediatePostingDate | intermediateExpiryDate | intermediateSecurityCode | intermediateIsin |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |                         |             |                         |                        |                          |                  |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |                         |             |                         |                        |                          |                  |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |                         |             |                         |                        |                          |                  |
      | 01700                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |                         |             |                         |                        |                          |                  |
      | 01703                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |                         |             |                         |                        |                          |                  |
      | 00720                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-04  | RightsIssue     |           | AcceleratedRenounceable |             | 2019-02-26              | 2019-02-26             | WOW                      | AU0000WOW126     |

    And today is 2019-02-21
    And today is 2019-02-22

    And "00002" sends a "BMW/inte914" message with values:
      | MessageId       | 00002\|11111111111111111111111111111 |
      | ActionType      | DELT                                 |
      | BasisOfQuote    | CC                                   |
      | BasisOfMovement | CCRT                                 |

    Then "{party:uiOps}" should receive a "BMW/inte916" message with values:
      | OrigBizMsgIdr | 00002\|11111111111111111111111111111 |
      | StatusCode    | COMP                                 |

    And messageId is "<Sender Actor ID>\|11111111111111111111111111111"
    And transactionId is "<Sender Actor ID>\|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

    And "fixed elements" table contains
      | bmwBizMsgIdr     | {messageId}     |
      | TransactionId    | {transactionId} |
      | Payment          | FREE            |
      | ParticipantRef   | /PRTY/TRF100    |
      | UnderlyingRef    | /UNDR/TRF300    |
      | SttlmtDt         | 2018-08-01      |
      | SettlmQty        | 500             |
      | TransactionBasis | MRKT            |
      | SttlmTxCond      | BDTR            |

    When "<Sender Actor ID>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | SctiesMvmntTp     | DELI           |
      | SecurityRefCode   | <ASX Code>     |
      | SettlmQty         | 500            |
      | AccountHIN        | 0010000023     |
      | TransactionBasis  | MRKT           |
      | DeliveringActorId | 01442          |
      | ReceivingActorId  | 01443          |
      | OverrideBOMs      | <OverrideBOMs> |
      | ISIN              | <ISIN>         |

    Then "<Sender Actor ID>" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {messageId}          |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-1683
    Examples:
      | AC            | OverrideBOMs   | ASX Code | ISIN         | Sender Actor ID | Reject Reason                                 | Reject Description                                                                                    | Description                                                                                             |
      | SPD-1683-AC01 |                | WOW      | AU0000WOW126 | 01442           | {error:requestedQuantityGreaterThanAvailable} | Requested quantity is greater than the available balance in '0010000023'                              | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN                           |
      | SPD-1683-AC02 | CBNS,CDIV      | WOW      | AU0000WOW126 | 01442           | {error:requestedQuantityGreaterThanAvailable} | Requested quantity is greater than the available balance in '0010000023'                              | Nack, oBOM provided as 'cum' and insufficient CEB Units available in Delivering HIN                     |
      | SPD-1683-AC03 | CDIV,CDIV      | CBA      | AU0000CBA123 | 01442           | {error:valueInvalid}                          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CDIV' value is invalid              | Nack, two or more Override Basis of Movement                                                            |
      | SPD-1683-AC04 | CDIV,XDIV      | CBA      | AU0000CBA123 | 01442           | {error:valueInvalid}                          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'XDIV' value is invalid              | Nack, two or more Override Basis of Movement with the same final three letters                          |
      | SPD-1683-AC05 | CDIV,XBNS,CRTS | CBA      | AU0000CBA123 | 01442           | {error:valueInvalid}                          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CRTS' value is invalid              | Nack, One or more Override Basis of Movement do not correspond to the BOM Type of a Corporate Action Id |
      | SPD-1683-AC06 | CDIV,XBNS,CCRT | CBA      | AU0000CBA123 | 01442           | {error:valueInvalid}                          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CCRT' value is invalid              | Nack, isn't a valid BOM Code on the BOQ/BOM Table                                                       |
      | SPD-1683-AC07 | CDIV           | CBA      | AU0000CBA123 | 01442           | {error:additionalInstancesExpected}           | Additional instances of /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id are expected | Nack, There are less Override Basis of Movement than Corporate Action Ids                               |


  # Validate oBOM and CEB
  # obom is not replayed on Hold208 allegement egress and it should be
  # Validate oBOM and CEB

  Scenario Outline: <AC> - Bilateral Demand Transfer Ack (8,10) Determine Basis of Movement and Effect Cum Entitlement Balance <Description>
    Given pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And messageId1 is "<Sender Actor ID>\|11111111111111111111111111111"
    And transactionId1 is "<Sender Actor ID>\|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And messageId2 is "<Sender Actor ID>\|22222222222222222222222222222"
    And transactionId2 is "<Sender Actor ID>\|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And messageId3 is "<Sender Actor ID>\|33333333333333333333333333333"
    And transactionId3 is "<Sender Actor ID>\|CCCCCCCCCCCCCCCCCCCCCCCCCCCCC"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 01700                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |           |                         |                      |             |
      | 01703                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |           |                         |                      |             |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    # Note: This UDTR is used to transfer 500 units EX to top up the test account to 1000 Units/500 CEB.
    And "<Sender Actor ID>" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId1}     |
      | TransactionId     | {transactionId1} |
      | SttlmtDt          | 2019-02-20       |
      | SttlmTxCond       | UDTR             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | DeliveringHIN     | 0010000024       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01442            |
      | ReceivingHIN      | 0010000023       |
      | OverrideBOMs      | XDIV,XBNS        |

    And "<Sender Actor ID>" should receive a "BMW/hold202" message with values:
      | relatedFromUic    | <Sender Actor ID> |
      | relatedToUic      | {party:operator}  |
      | relatedBizMsgIdr  | {messageId1}      |
      | AccountOwnerTxId  | {transactionId1}  |
      | ISIN              | <ISIN>            |
      | EffectiveSttlmtDt | 2019-02-21        |
      | SttlmTxCond       | UDTR              |
      | SecurityCode      | <ASX Code>        |
      | SettlmQty         | 500               |
      | AccountHIN        | 0010000024        |
      | TransactionBasis  | MRKT              |
      | DeliveringActorId | 01442             |
      | ReceivingActorId  | 01442             |
      | CounterPartyHIN   | 0010000023        |
      | DlvrgHldgBal      | 500               |
      | RcvgHldgBal       | 1000              |
      | OverrideBOMs      | XBNS,XDIV         |

    And "fixed elements" table contains
      | Payment          | FREE         |
      | ParticipantRef   | /PRTY/TRF100 |
      | UnderlyingRef    | /UNDR/TRF300 |
      | SttlmtDt         | 2019-02-21   |
      | SettlmQty        | 500          |
      | TransactionBasis | MRKT         |
      | SttlmTxCond      | BDTR         |

    # Send a BDTR for 500 Units CUM and check that it succeeds. Should leave an available balance of 500/0
    And "<Sender Actor ID>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId2} |
      | bmwBizMsgIdr      | {messageId2}     |
      | SctiesMvmntTp     | DELI             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000023       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs>   |
      | ISIN              | <ISIN>           |

    And "<Sender Actor ID>" should receive a "BMW/hold207" message with values
      | relatedFromUic   | <Sender Actor ID> |
      | relatedToUic     | {party:operator}  |
      | TransactionId    | {transactionId2}  |
      | Reason           | Unmatched         |
      | relatedToUic     | 00001             |
      | relatedBizMsgIdr | {messageId2}      |

    #208 allegement should replay oBOMs in original hold201 message
    And "01443" should receive a "BMW/hold208" message with values
      | CounterpartyTransactionId | {transactionId2}  |
      | SctiesMvmntTp             | DELI              |
      | Payment                   | FREE              |
      | SupplementaryRef          |                   |
      | SttlmDt                   | 2019-02-21        |
      | ISIN                      | <ISIN>            |
      | SecurityRefCode           | <ASX Code>        |
      | SttlmQty                  | 500               |
      | TransactionBasis          | MRKT              |
      | SttlmTxCond               | BDTR              |
      | DeliveringActorId         | <Sender Actor ID> |
      | ReceivingActorId          | 01443             |
      | SecondaryMatching         |                   |
      | ForeignInd                |                   |
      | OverrideBOMs              | <OverrideBOMs>    |

    # Send a BDTR for another 500 Units CUM, check that it fails (insufficient CEB) despite having sufficient units.
    When "<Sender Actor ID>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId3} |
      | bmwBizMsgIdr      | {messageId3}     |
      | SctiesMvmntTp     | DELI             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000023       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs>   |
      | ISIN              | <ISIN>           |

    Then "<Sender Actor ID>" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {messageId3}         |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-7812 @SPD-1683
    Examples:
      | AC                            | OverrideBOMs | ASX Code | ISIN         | Sender Actor ID | Reject Reason                                 | Reject Description                                                       | Description                                                                                                                               |
      | SPD-1683-AC08, SPD-7812-ACBug | CDIV,CBNS    | WOW      | AU0000WOW126 | 01442           | {error:requestedQuantityGreaterThanAvailable} | Requested quantity is greater than the available balance in '0010000023' | Ack for BDTR, A "cum" Override Basis of Movement is provided resulting in Delivering Units locked                                         |
      | SPD-1683-AC10, SPD-7812-ACBug |              | WOW      | AU0000WOW126 | 01442           | {error:requestedQuantityGreaterThanAvailable} | Requested quantity is greater than the available balance in '0010000023' | Ack for BDTR, no oBOM provided but CA is present on security, resulting in BOM determined as 'cum' and units locked in Delivering Account |

  # Validate oBOM and CEB


  Scenario Outline: <AC> - Bilateral Demand Transfer Ack (9) Determine Basis of Movement and Effect Cum Entitlement Balance <Description>
    Given pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And messageId1 is "<Sender Actor ID>\|11111111111111111111111111111"
    And transactionId1 is "<Sender Actor ID>\|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And messageId2 is "<Sender Actor ID>\|22222222222222222222222222222"
    And transactionId2 is "<Sender Actor ID>\|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And messageId3 is "<Sender Actor ID>\|33333333333333333333333333333"
    And transactionId3 is "<Sender Actor ID>\|CCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
    And determinedBOMs is "XBNS,XDIV"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    When "<Sender Actor ID>" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {messageId1}     |
      | TransactionId     | {transactionId1} |
      | SttlmtDt          | 2019-02-20       |
      | SttlmTxCond       | UDTR             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | DeliveringHIN     | 0010000024       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01442            |
      | ReceivingHIN      | 0010000023       |
      | OverrideBOMs      | XDIV,XBNS        |

    Then "<Sender Actor ID>" should receive a "BMW/hold202" message with values:
      | relatedFromUic    | <Sender Actor ID> |
      | relatedToUic      | {party:operator}  |
      | relatedBizMsgIdr  | {messageId1}      |
      | AccountOwnerTxId  | {transactionId1}  |
      | ISIN              | <ISIN>            |
      | EffectiveSttlmtDt | 2019-02-21        |
      | SttlmTxCond       | UDTR              |
      | SecurityCode      | <ASX Code>        |
      | SettlmQty         | 500               |
      | AccountHIN        | 0010000024        |
      | TransactionBasis  | MRKT              |
      | DeliveringActorId | 01442             |
      | ReceivingActorId  | 01442             |
      | CounterPartyHIN   | 0010000023        |
      | DlvrgHldgBal      | 500               |
      | RcvgHldgBal       | 1000              |
      | OverrideBOMs      | {determinedBOMs}  |

    When "fixed elements" table contains
      | Payment          | FREE         |
      | ParticipantRef   | /PRTY/TRF100 |
      | UnderlyingRef    | /UNDR/TRF300 |
      | SttlmtDt         | 2019-02-21   |
      | SettlmQty        | 500          |
      | TransactionBasis | MRKT         |
      | SttlmTxCond      | BDTR         |

    # Send a BDTR for 500 Units CUM and check that it succeeds. Should leave an available balance of 500/0
    And "<Sender Actor ID>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId2} |
      | bmwBizMsgIdr      | {messageId2}     |
      | SctiesMvmntTp     | DELI             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000023       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs>   |
      | ISIN              | <ISIN>           |

    Then "<Sender Actor ID>" should receive a "BMW/hold207" message with values merged with "fixed elements":
      | relatedFromUic | <Sender Actor ID> |
      | relatedToUic   | {party:operator}  |
      | TransactionId  | {transactionId2}  |
      | Reason         | Unmatched         |

    # Send a BDTR for another 500 Units CUM, check that it fails (insufficient CEB) despite having sufficient units.
    When "<Sender Actor ID>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId3} |
      | bmwBizMsgIdr      | {messageId3}     |
      | SctiesMvmntTp     | DELI             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000023       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs>   |
      | ISIN              | <ISIN>           |

    Then "<Sender Actor ID>" should receive a "BMW/hold207" message with values merged with "fixed elements":
      | relatedFromUic | <Sender Actor ID> |
      | relatedToUic   | {party:operator}  |
      | TransactionId  | {transactionId3}  |
      | Reason         | Unmatched         |

    @SPD-1683
    @unimplemented
    Examples:
      | AC            | OverrideBOMs | ASX Code | ISIN         | Sender Actor ID | Description                                                                                                                             |
      | SPD-1683-AC09 | XDIV,XBNS    | WOW      | AU0000WOW126 | 01442           | Ack for BDTR, An "ex" Override Basis of Movement results in the Basis of Movement determined as the Override Basis of Movement value(s) |

  # Validate oBOM and CEB

  Scenario Outline: <AC> - Bilateral Demand Transfer Ack (11) Determine Basis of Movement and Effect Cum Entitlement Balance <Description>
    Given pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And messageId1 is "<Sender ID1>\|11111111111111111111111111111"
    And transactionId1 is "<Sender ID1>\|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And messageId2 is "<Sender ID2>\|22222222222222222222222222222"
    And transactionId2 is "<Sender ID2>\|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 126        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    When "fixed elements" table contains
      | Payment          | FREE         |
      | ParticipantRef   | /PRTY/TRF100 |
      | UnderlyingRef    | /UNDR/TRF300 |
      | SttlmtDt         | 2019-02-21   |
      | SettlmQty        | 500          |
      | TransactionBasis | MRKT         |
      | SttlmTxCond      | BDTR         |

    And "<Sender ID1>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId1} |
      | bmwBizMsgIdr      | {messageId1}     |
      | SctiesMvmntTp     | DELI             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000023       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs>   |
      | ISIN              | <ISIN>           |

    Then "<Sender ID1>" should receive a "BMW/hold207" message with values merged with "fixed elements":
      | relatedFromUic | <Sender ID1>     |
      | relatedToUic   | {party:operator} |
      | TransactionId  | {transactionId1} |
      | Reason         | Unmatched        |

    When "<Sender ID2>" sends a "BMW/hold201" message with values merged with "fixed elements":
      | TransactionId     | {transactionId2} |
      | bmwBizMsgIdr      | {messageId2}     |
      | SctiesMvmntTp     | RECE             |
      | SecurityRefCode   | <ASX Code>       |
      | SettlmQty         | 500              |
      | AccountHIN        | 0010000031       |
      | TransactionBasis  | MRKT             |
      | DeliveringActorId | 01442            |
      | ReceivingActorId  | 01443            |
      | OverrideBOMs      | <OverrideBOMs2>  |
      | ISIN              | <ISIN>           |

    Then "<Sender ID2>" should receive a "BMW/hold207" message with values merged with "fixed elements":
      | relatedFromUic | <Sender ID2>     |
      | relatedToUic   | {party:operator} |
      | TransactionId  | {transactionId2} |
      | Reason         | Unmatched        |

    @SPD-1683
    Examples:
      | AC            | OverrideBOMs | OverrideBOMs2 | ASX Code | ISIN         | Sender ID1 | Sender ID2 | Description                                                                                                                                                                                                   |
      | SPD-1683-AC11 | XDIV,XBNS    | CDIV,CBNS     | WOW      | AU0000WOW126 | 01442      | 01443      | AC 11: Ack for BDTR, one or more Basis of Movement are not the same as any previously submitted Bilateral Demand Transfer Requests results in Status Advice (Unmatched) and Allegement Notification messages. |


  Scenario Outline: <AC> - Perform Matching on BOM and Effect CEB Transfer - Ack scenarios <Description>
    Given deliverer is "01440"
    And receiver is "01441"
    And delivererAccount is "0010000008"
    And receiverAccount is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And securityId is "123"
    And transactionBasis is "MRKT"
    And settlmQty is "100"
    And transactionCondition is "BDTR"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And determinedBOMs is "CBNS, CDIV"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}           |
      | AccountId         | {delivererAccount}    |
      | UnitQuantity      | 100.00000000000000000 |
      | CorporateActionId | 01700                 |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}           |
      | AccountId         | {delivererAccount}    |
      | UnitQuantity      | 100.00000000000000000 |
      | CorporateActionId | 01703                 |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}            |
      | AccountId         | {receiverAccount}     |
      | UnitQuantity      | 200.00000000000000000 |
      | CorporateActionId | 01700                 |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}            |
      | AccountId         | {receiverAccount}     |
      | UnitQuantity      | 200.00000000000000000 |
      | CorporateActionId | 01703                 |

    When "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA001           |
      | TransactionId     | 01440\|BB001           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringHoldingCid}" and values
      | ActorParty   | {deliverer}                                  |
      | AccountId    | {delivererAccount}                           |
      | UnitQuantity | 0                                            |
      | SecurityId   | {securityId}                                 |
      | Locked       | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringCEB1}" and values
      | ActorParty        | {deliverer}                                  |
      | AccountId         | {delivererAccount}                           |
      | UnitQuantity      | 0                                            |
      | CorporateActionId | 01700                                        |
      | Locked            | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringCEB2}" and values
      | ActorParty        | {deliverer}                                  |
      | AccountId         | {delivererAccount}                           |
      | UnitQuantity      | 0                                            |
      | CorporateActionId | 01703                                        |
      | Locked            | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{receiver}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01441\|AA002           |
      | TransactionId     | 01441\|BB002           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {receiverAccount}      |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <RecOverrideBOMs>      |
      | SctiesMvmntTp     | RECE                   |

    And "hold202 template" table contains
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | ISIN              | AU0000CBA123           |
      | SecurityCode      | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | Payment           | FREE                   |
      | SttlmTxCond       | BDTR                   |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |

    Then "{deliverer}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01440\|BB001              |
      | CounterpartyTxId  | 01441\|BB002              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {delivererAccount}        |
      | DlvrgHldgBal      | 0                         |
      | ObligationId      | {CAPTURE:delObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | related           | absent                    |

    And "{receiver}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01441\|BB002              |
      | CounterpartyTxId  | 01440\|BB001              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {receiverAccount}         |
      | RcvgHldgBal       | 300                       |
      | ObligationId      | {CAPTURE:recObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | relatedFromUic    | {receiver}                |
      | relatedToUic      | {party:operator}          |
      | SctiesMvmntTp     | RECE                      |

    And recObligationId is equal to delObligationId

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty   | {receiver}        |
      | AccountId    | {receiverAccount} |
      | UnitQuantity | 300               |
      | SecurityId   | {securityId}      |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}        |
      | AccountId         | {receiverAccount} |
      | UnitQuantity      | 300               |
      | CorporateActionId | 01700             |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}        |
      | AccountId         | {receiverAccount} |
      | UnitQuantity      | 300               |
      | CorporateActionId | 01703             |

    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringHoldingCid}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringCEB1}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringCEB2}"

    @SPD-1684
    Examples:
      | AC            | OverrideBOMs | RecOverrideBOMs | Description                                                                                                                   |
      | SPD-1684-AC01 | CDIV,CBNS    | CDIV, CBNS      | Match, Basis of Movement are the same                                                                                         |
      | SPD-1684-AC02 | CBNS,CDIV    | CBNS, CDIV      | Match, Basis of Movement are provided in different orders                                                                     |
      | SPD-1684-AC03 | CDIV,CBNS    |                 | Match, One or more Basis of Movement is "cum", results in CEB reduced in Delivering Account and increase in Receiving Account |
      | SPD-1684-AC03 |              |                 | Match, no Override Basis Of Movement so "cum", results in CEB reduced in Delivering Account and increase in Receiving Account |


  Scenario Outline: <AC> - test with CEB balance not being transferred out. <Description>
    Given deliverer is "01440"
    And receiver is "01441"
    And delivererAccount is "0010000008"
    And receiverAccount is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And securityId is "123"
    And transactionBasis is "MRKT"
    And settlmQty is "100"
    And transactionCondition is "BDTR"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And determinedBOMs is "CBNS, XDIV"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}        |
      | AccountId         | {delivererAccount} |
      | UnitQuantity      | 100                |
      | CorporateActionId | 01700              |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}        |
      | AccountId         | {delivererAccount} |
      | UnitQuantity      | 100                |
      | CorporateActionId | 01703              |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}        |
      | AccountId         | {receiverAccount} |
      | UnitQuantity      | 200               |
      | CorporateActionId | 01700             |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}        |
      | AccountId         | {receiverAccount} |
      | UnitQuantity      | 200               |
      | CorporateActionId | 01703             |

    When "{deliverer}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA001           |
      | TransactionId     | 01440\|BB001           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringHoldingCid}" and values
      | ActorParty   | {deliverer}                                  |
      | AccountId    | {delivererAccount}                           |
      | UnitQuantity | 0                                            |
      | SecurityId   | {securityId}                                 |
      | Locked       | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringCEB1}" and values
      | ActorParty        | {deliverer}                                  |
      | AccountId         | {delivererAccount}                           |
      | UnitQuantity      | 0                                            |
      | CorporateActionId | 01700                                        |
      | Locked            | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{receiver}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01441\|AA002           |
      | TransactionId     | 01441\|BB002           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {receiverAccount}      |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <RecOverrideBOMs>      |
      | SctiesMvmntTp     | RECE                   |

    And "hold202 template" table contains
      | SupplementaryRef  | {supplementaryRef} |
      | ParticipantRef    | {participantRef}   |
      | UnderlyingRef     | {underlyingRef}    |
      | ISIN              | AU0000CBA123       |
      | SecurityCode      | {securityRefCode}  |
      | SettlmQty         | {settlmQty}        |
      | Payment           | FREE               |
      | SttlmTxCond       | BDTR               |
      | TransactionBasis  | {transactionBasis} |
      | DeliveringActorId | {deliverer}        |
      | ReceivingActorId  | {receiver}         |

    Then "{deliverer}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01440\|BB001              |
      | CounterpartyTxId  | 01441\|BB002              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {delivererAccount}        |
      | DlvrgHldgBal      | 0                         |
      | ObligationId      | {CAPTURE:delObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | related           | absent                    |

    And "{receiver}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01441\|BB002              |
      | CounterpartyTxId  | 01440\|BB001              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {receiverAccount}         |
      | RcvgHldgBal       | 300                       |
      | ObligationId      | {CAPTURE:recObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | relatedFromUic    | {receiver}                |
      | relatedToUic      | {party:operator}          |
      | SctiesMvmntTp     | RECE                      |

    And recObligationId is equal to delObligationId

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty   | {receiver}        |
      | AccountId    | {receiverAccount} |
      | UnitQuantity | 300               |
      | SecurityId   | {securityId}      |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {receiver}        |
      | AccountId         | {receiverAccount} |
      | UnitQuantity      | 300               |
      | CorporateActionId | 01700             |

    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringHoldingCid}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringCEB1}"

    @SPD-1684
    Examples:
      | AC            | OverrideBOMs | RecOverrideBOMs | Description                                                                       |
      | SPD-1684-AC04 | XDIV,CBNS    | CBNS,XDIV       | Match, One or more Basis of Movement is "ex", results in no change in CEB Balance |


  Scenario Outline: <AC> - second test that has all corporate actions as 'ex', resulting in no CEB balance being transferred out. <Description>
    Given deliverer is "01440"
    And receiver is "01441"
    And delivererAccount is "0010000008"
    And receiverAccount is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And securityId is "123"
    And transactionBasis is "MRKT"
    And settlmQty is "100"
    And transactionCondition is "BDTR"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And determinedBOMs is "XBNS, XDIV"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid      | ActorParty  | AccountId          | CorporateActionId | UnitQuantity |
      | {IGNORE} | {deliverer} | {delivererAccount} | 01700             | 100          |
      | {IGNORE} | {deliverer} | {delivererAccount} | 01703             | 100          |
      | {IGNORE} | {receiver}  | {receiverAccount}  | 01700             | 200          |
      | {IGNORE} | {receiver}  | {receiverAccount}  | 01703             | 200          |

    When "{deliverer}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA001           |
      | TransactionId     | 01440\|BB001           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:deliveringHoldingCid}" and values
      | ActorParty   | {deliverer}                                  |
      | AccountId    | {delivererAccount}                           |
      | UnitQuantity | 0                                            |
      | SecurityId   | {securityId}                                 |
      | Locked       | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{receiver}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01441\|AA002           |
      | TransactionId     | 01441\|BB002           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {receiverAccount}      |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <RecOverrideBOMs>      |
      | SctiesMvmntTp     | RECE                   |

    And "hold202 template" table contains
      | SupplementaryRef  | {supplementaryRef} |
      | ParticipantRef    | {participantRef}   |
      | UnderlyingRef     | {underlyingRef}    |
      | ISIN              | AU0000CBA123       |
      | SecurityCode      | {securityRefCode}  |
      | SettlmQty         | {settlmQty}        |
      | Payment           | FREE               |
      | SttlmTxCond       | BDTR               |
      | TransactionBasis  | {transactionBasis} |
      | DeliveringActorId | {deliverer}        |
      | ReceivingActorId  | {receiver}         |

    Then "{deliverer}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01440\|BB001              |
      | CounterpartyTxId  | 01441\|BB002              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {delivererAccount}        |
      | DlvrgHldgBal      | 0                         |
      | ObligationId      | {CAPTURE:delObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | related           | absent                    |

    And "{receiver}" should receive a "BMW/hold202" message with values merged with "hold202 template":
      | AccountOwnerTxId  | 01441\|BB002              |
      | CounterpartyTxId  | 01440\|BB001              |
      | EffectiveSttlmtDt | 2019-02-21                |
      | AccountHIN        | {receiverAccount}         |
      | RcvgHldgBal       | 300                       |
      | ObligationId      | {CAPTURE:recObligationId} |
      | OverrideBOMs      | {determinedBOMs}          |
      | relatedFromUic    | {receiver}                |
      | relatedToUic      | {party:operator}          |
      | SctiesMvmntTp     | RECE                      |

    And recObligationId is equal to delObligationId

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty   | {receiver}        |
      | AccountId    | {receiverAccount} |
      | UnitQuantity | 300               |
      | SecurityId   | {securityId}      |

    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringHoldingCid}"

    @SPD-1684
    Examples:
      | AC            | OverrideBOMs | RecOverrideBOMs | Description                                                                 |
      | SPD-1684-AC04 | XDIV,XBNS    | XBNS,XDIV       | Match, All Basis of Movements are "ex", results in no change in CEB Balance |


  #Unlock Cum Entitlement Balance
  Scenario Outline: <AC> - CUDT Daily Cancellation of outstanding settlement instructions: 02 AC - locked units become available for use
    Given deliverer is "01440"
    And receiver is "01441"
    And delivererAccount is "0010000008"
    And receiverAccount is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And securityId is "123"
    And transactionBasis is "MRKT"
    And settlmQty is "50"
    And transactionCondition is "BDTR"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And issuer is "75001"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid      | ActorParty  | AccountId          | CorporateActionId | UnitQuantity |
      | {IGNORE} | {deliverer} | {delivererAccount} | 01700             | 100          |
      | {IGNORE} | {deliverer} | {delivererAccount} | 01703             | 100          |
    And "{receiver}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid      | ActorParty | AccountId         | CorporateActionId | UnitQuantity |
      | {IGNORE} | {receiver} | {receiverAccount} | 01700             | 200          |
      | {IGNORE} | {receiver} | {receiverAccount} | 01703             | 200          |

    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid      | Issuer   | AccountId          | CorporateActionId | Total | Available |
      | {IGNORE} | {issuer} | {delivererAccount} | 01700             | 100   | 100       |
      | {IGNORE} | {issuer} | {delivererAccount} | 01703             | 100   | 100       |
      | {IGNORE} | {issuer} | {receiverAccount}  | 01700             | 200   | 200       |
      | {IGNORE} | {issuer} | {receiverAccount}  | 01703             | 200   | 200       |

    When "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA001           |
      | TransactionId     | 01440\|BB001           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid                             | ActorParty  | AccountId          | SecurityId   | CorporateActionId | UnitQuantity | Locked                                       |
      | {CAPTURE:deliveringHoldingCid1} | {deliverer} | {delivererAccount} | {securityId} |                   | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB1}        | {deliverer} | {delivererAccount} |              | 01700             | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB2}        | {deliverer} | {delivererAccount} |              | 01703             | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid                                   | Issuer   | AccountId          | SecurityId   | CorporateActionId | Total | Available   |
      | {CAPTURE:deliveringHoldingCid1Issuer} | {issuer} | {delivererAccount} | {securityId} |                   | 100   | {settlmQty} |
      | {CAPTURE:deliveringCEB1Issuer}        | {issuer} | {delivererAccount} |              | 01700             | 100   | {settlmQty} |
      | {CAPTURE:deliveringCEB2Issuer}        | {issuer} | {delivererAccount} |              | 01703             | 100   | {settlmQty} |

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA002           |
      | TransactionId     | 01440\|BB002           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid                             | ActorParty  | AccountId          | SecurityId   | CorporateActionId | UnitQuantity | Locked                                                                                   |
      | {CAPTURE:deliveringHoldingCid2} | {deliverer} | {delivererAccount} | {securityId} |                   | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB3}        | {deliverer} | {delivererAccount} |              | 01700             | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB4}        | {deliverer} | {delivererAccount} |              | 01703             | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |

    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid                                   | Issuer   | AccountId          | SecurityId   | CorporateActionId | Total | Available |
      | {CAPTURE:deliveringHoldingCid2Issuer} | {issuer} | {delivererAccount} | {securityId} |                   | 100   | 0         |
      | {CAPTURE:deliveringCEB3Issuer}        | {issuer} | {delivererAccount} |              | 01700             | 100   | 0         |
      | {CAPTURE:deliveringCEB4Issuer}        | {issuer} | {delivererAccount} |              | 01703             | 100   | 0         |

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA003           |
      | TransactionId     | 01440\|BB003           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" should receive a "BMW/comm808" message with values:
      | RelatedReference  | 01440\|AA003                                                             |
      | RejectionReason   | 1084                                                                     |
      | ReasonDescription | Requested quantity is greater than the available balance in '0010000008' |

    # Roll the business date
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | 00000\|33333333333333333333333333333 |
      | EventCode    | BDRN                                 |
      | BusinessDate | 2019-02-22                           |

    Then the "{party:scheduler}" should receive multiple "BMW/inte901" messages with values:
      | OrigBizMsgIdr                        | StatusCode |
      | 00000\|33333333333333333333333333333 | ACCP       |
      | 00000\|33333333333333333333333333333 | COMP       |

    # Now purge the queue for previous business date
    Then the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | 00000\|44444444444444444444444444444 |
      | EventCode    | CUDT                                 |

    Then the "{party:scheduler}" should receive multiple "BMW/inte901" messages with values:
      | OrigBizMsgIdr                        | StatusCode |
      | 00000\|44444444444444444444444444444 | ACCP       |
      | 00000\|44444444444444444444444444444 | COMP       |

    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid      | ActorParty  | AccountId          | SecurityId   | CorporateActionId | UnitQuantity |
      | {IGNORE} | {deliverer} | {delivererAccount} | {securityId} |                   | 100          |
      | {IGNORE} | {deliverer} | {delivererAccount} |              | 01700             | 100          |
      | {IGNORE} | {deliverer} | {delivererAccount} |              | 01703             | 100          |

    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid      | Issuer   | AccountId          | SecurityId   | CorporateActionId | Total | Available |
      | {IGNORE} | {issuer} | {delivererAccount} | {securityId} |                   | 100   | 100       |
      | {IGNORE} | {issuer} | {delivererAccount} |              | 01700             | 100   | 100       |
      | {IGNORE} | {issuer} | {delivererAccount} |              | 01703             | 100   | 100       |

    And "{deliverer}" should observe the archival of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with contract ids "{deliveringHoldingCid1},{deliveringHoldingCid2},{deliveringCEB1},{deliveringCEB2},{deliveringCEB3},{deliveringCEB4}"
    And "{issuer}" should observe the archival of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with contract ids "{deliveringHoldingCid1Issuer},{deliveringHoldingCid2Issuer},{deliveringCEB1Issuer},{deliveringCEB2Issuer},{deliveringCEB3Issuer},{deliveringCEB4Issuer}"

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA003           |
      | TransactionId     | 01440\|BB003           |
      | SttlmtDt          | 2019-02-22             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    @SPD-1705 @SPD-6461 @SPD-6462 @SPD-6886 @SPD-6887
    Examples:
      | AC                                                                        | OverrideBOMs | Description                                                                         |
      | SPD-1705-AC02, SPD-6461-AC01, SPD-6462-AC02, SPD-6886-AC01, SPD-6887-AC01 | CDIV,CBNS    | CUDT job recieved from schedular unlocks units which can be used for other purposes |


  #Unlock Cum Entitlement Balance
  Scenario Outline: <AC> - Cancellation message sent for outstanding settlement instructions - locked units become available for use
    Given deliverer is "01440"
    And receiver is "01441"
    And delivererAccount is "0010000008"
    And receiverAccount is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And securityId is "123"
    And transactionBasis is "MRKT"
    And settlmQty is "50"
    And transactionCondition is "BDTR"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode |
      | 01700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue    |
      | 01703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend  |

    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | ActorParty  | AccountId          | CorporateActionId | UnitQuantity |
      | {receiver}  | {receiverAccount}  | 01700             | 200          |
      | {receiver}  | {receiverAccount}  | 01703             | 200          |
      | {deliverer} | {delivererAccount} | 01700             | 100          |
      | {deliverer} | {delivererAccount} | 01703             | 100          |

    When "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA001           |
      | TransactionId     | 01440\|BB001           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{party:operator}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid                             | ActorParty  | AccountId          | CorporateActionId | SecurityId   | UnitQuantity | Locked                                       |
      | {CAPTURE:deliveringHoldingCid1} | {deliverer} | {delivererAccount} |                   | {securityId} | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB1}        | {deliverer} | {delivererAccount} | 01700             |              | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB2}        | {deliverer} | {delivererAccount} | 01703             |              | {settlmQty}  | SettlementLock:01440\|BB001:{settlmQty}: : ; |

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA002           |
      | TransactionId     | 01440\|BB002           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    And "{party:operator}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid                             | ActorParty  | AccountId          | CorporateActionId | SecurityId   | UnitQuantity | Locked                                                                                   |
      | {CAPTURE:deliveringHoldingCid2} | {deliverer} | {delivererAccount} |                   | {securityId} | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB3}        | {deliverer} | {delivererAccount} | 01700             |              | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |
      | {CAPTURE:deliveringCEB4}        | {deliverer} | {delivererAccount} | 01703             |              | 0            | SettlementLock:01440\|BB002:{settlmQty}: : ;SettlementLock:01440\|BB001:{settlmQty}: : ; |

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA003           |
      | TransactionId     | 01440\|BB003           |
      | SttlmtDt          | 2019-02-21             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" should receive a "BMW/comm808" message with values:
      | RelatedReference  | 01440\|AA003                                                             |
      | RejectionReason   | 1084                                                                     |
      | ReasonDescription | Requested quantity is greater than the available balance in '0010000008' |


    When "{deliverer}" sends a "BMW/hold209" message with values:
      | bmwBizMsgIdr        | {deliverer}\|22222222222222222222222222222 |
      | SctiesMvmntTp       | DELI                                       |
      | TargetTransactionId | 01440\|BB001                               |
      | RequestingHin       | {delivererAccount}                         |

    # Assert correct notification are sent out to correct parties
    Then "{deliverer}" should receive a "BMW/hold210" message with values:
      | relatedFromUic | relatedToUic | relatedBizMsgIdr                           | CancellingTransactionId               | TargetTransactionId | SctiesMvmntTp | Payment | CancellationReason |
      | {deliverer}    | 00001        | {deliverer}\|22222222222222222222222222222 | {REGEX:00001\\\\\|[ -\{\}-~]\{1,29\}} | 01440\|BB001        | DELI          | FREE    | CANI               |

    And "{receiver}" should receive a "BMW/hold215" message with values:
      | bmwToUic   | TargetTransactionId | SctiesMvmntTp | Payment | Account |
      | {receiver} | 01440\|BB001        | DELI          | FREE    | DEFAULT |

    And "{party:operator}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | ActorParty  | AccountId          | CorporateActionId | SecurityId   | UnitQuantity | Locked                                       |
      | {deliverer} | {delivererAccount} | 01700             |              | 50           | SettlementLock:01440\|BB002:{settlmQty}: : ; |
      | {deliverer} | {delivererAccount} | 01703             |              | 50           | SettlementLock:01440\|BB002:{settlmQty}: : ; |
      | {deliverer} | {delivererAccount} |                   | {securityId} | 50           | SettlementLock:01440\|BB002:{settlmQty}: : ; |

    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringHoldingCid1}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringCEB1}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{deliveringCEB2}"

    Then "{deliverer}" sends a "BMW/hold201" message with values:
      | bmwBizMsgIdr      | 01440\|AA004           |
      | TransactionId     | 01440\|BB004           |
      | SttlmtDt          | 2019-02-22             |
      | SecurityRefCode   | {securityRefCode}      |
      | SettlmQty         | {settlmQty}            |
      | AccountHIN        | {delivererAccount}     |
      | TransactionBasis  | {transactionBasis}     |
      | SttlmTxCond       | {transactionCondition} |
      | DeliveringActorId | {deliverer}            |
      | ReceivingActorId  | {receiver}             |
      | SupplementaryRef  | {supplementaryRef}     |
      | ParticipantRef    | {participantRef}       |
      | UnderlyingRef     | {underlyingRef}        |
      | OverrideBOMs      | <OverrideBOMs>         |

    Then "{deliverer}" receives a "BMW" message with schema location matching "hold_207"
    And "{receiver}" receives a "BMW" message with schema location matching "hold_208"

    @SPD-1705
    Examples:
      | AC            | OverrideBOMs | Description                                                                                     |
      | SPD-1705-AC01 | CDIV,CBNS    | Cancellation message received from deliverer unlocks units which can be used for other purposes |


  #Feature for Bilateral Demand Settlement Instructions
  @SPD-2421
  Scenario Outline: <AC> - NACKs oBOM Validation - <Description>
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And messageId is     "{delivererActor}|11111111111111111111111111111"
    And transactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "100"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "100"
    And settlementAmount_CdtDbtInd is "CRDT"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    Given "sett105 template" table contains
      | SecuritiesMovementType     | {securitiesMovementType}     |
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | AccountHIN                 | {deliverer}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | SettlementAmount_CdtDbtInd | {settlementAmount_CdtDbtInd} |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    # # Think of this as a flexible override system which can expand as necessary and is tolerant to sparse population of data
    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr  | {messageId}     |
      | TransactionId | {transactionId} |
      | OverrideBOMs  | <OverrideBOMs>  |

    Then "{delivererActor}" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {messageId}          |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-2421
    Examples:
      | AC            | OverrideBOMs     | Reject Reason | Reject Description                                                                                    | Description                                                                                             |
      | SPD-2421-AC01 |                  | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN                           |
      | SPD-2421-AC02 | CBNS, CDIV, CCRT | 1084          | Requested quantity is greater than the available balance in '{deliverer}'                             | Nack, oBOM provided as 'cum' and insufficient CEB Units available in Delivering HIN                     |
      | SPD-2421-AC03 | CDIV, CDIV, CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CDIV' value is invalid              | Nack, two or more Override Basis of Movement                                                            |
      | SPD-2421-AC04 | CDIV, XDIV, CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'XDIV' value is invalid              | Nack, two or more Override Basis of Movement with the same final three letters                          |
      | SPD-2421-AC05 | CBNS, CINT, CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CINT' value is invalid              | Nack, One or more Override Basis of Movement do not correspond to the BOM Type of a Corporate Action Id |
      | SPD-2421-AC06 | CBNS, CXXX, CCRT | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CXXX' value is invalid              | Nack, isn't a valid BOM Code on the BOQ/BOM Table                                                       |
      | SPD-2421-AC07 | CBNS, CDIV       | 1144          | Additional instances of /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id are expected | Nack, There are less Override Basis of Movement than Corporate Action Ids                               |


  Scenario Outline: <AC> - ACKS - BOMs determined as "cum" - <Description>
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And messageId is     "{delivererActor}|11111111111111111111111111111"
    And transactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And settlementAmount_CdtDbtInd is "CRDT"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | ACCP                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    Given "sett105 template" table contains
      | SecuritiesMovementType     | {securitiesMovementType}     |
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | AccountHIN                 | {deliverer}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | SettlementAmount_CdtDbtInd | {settlementAmount_CdtDbtInd} |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr  | {messageId}     |
      | TransactionId | {transactionId} |
      | OverrideBOMs  | <OverrideBOMs>  |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_109"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 123        | SettlementLock:{transactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb700SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 00700             | SettlementLock:{transactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb703SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 00703             | SettlementLock:{transactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb706SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 00706             | SettlementLock:{transactionId}:{settlmQty}: : ; |

    @SPD-2421 @SPD-2421
    Examples:
      | AC                           | OverrideBOMs   | Description                                                                                                                               |
      | SPD-2421-AC08, SPD-2421-AC09 | CBNS,CDIV,CCRT | Ack for BDSI, A "cum" Override Basis of Movement is provided resulting in Delivering Units locked                                         |
      | SPD-2421-AC10, SPD-2421-AC11 |                | Ack for BDSI, no oBOM provided but CA is present on security, resulting in BOM determined as 'cum' and units locked in Delivering account |


  Scenario Outline: <AC> - ACKS - BOMs determined as "ex" - <Description>
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And messageId is     "{delivererActor}|11111111111111111111111111111"
    And transactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And settlementAmount_CdtDbtInd is "CRDT"
    And payment is "APMT"
    And securitiesMovementType is "DELI"
    And tradeDate is "2019-02-21"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-22 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-22 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId}1 |
      | EventCode    | PCEB                      |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId}1 |
      | StatusCode    | COMP                      |

    And today is 2019-02-22

    # This causes the generation of CEB balances
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId}2 |
      | EventCode    | PCEB                      |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId}2 |
      | StatusCode    | COMP                      |

    Given "sett105 template" table contains
      | SecuritiesMovementType     | {securitiesMovementType}     |
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | AccountHIN                 | {deliverer}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | SettlementAmount_CdtDbtInd | {settlementAmount_CdtDbtInd} |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr  | {messageId}     |
      | TransactionId | {transactionId} |
      | OverrideBOMs  | <OverrideBOMs>  |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_109"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 123        | SettlementLock:{transactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb700SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 00700             | SettlementLock:{transactionId}:{settlmQty}: : ; |

    # NOTE(sseefried): It would be great if we could observe the absence of the 703 CEB Balance, which would could
    # technically do. However, observing the absence often leads to false positives on trivial schema changes so we do not.

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb706SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                          |
      | {delivererActor} | {deliverer} | 60           | 00706             | SettlementLock:{transactionId}:{settlmQty}: : ; |

    @SPD-2421
    Examples:
      | AC            | OverrideBOMs   | Description                                                                                                                     |
      | SPD-2421-AC09 | CBNS,XDIV,CCRT | ACK for BDSI, A "ex" Override Basis of Movement is provided resulting in no delivering units locked for those corporate actions |
      | SPD-2421-AC12 |                | Ack for BDSI, no oBOM provided but tradeDate >= exDate resulting in no delivering units locked for that corporate action        |


  Scenario Outline: <AC> - BOM Matching - Basis of Movement not matching results in no match - <Description>
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And delivererMessageId is     "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And receiverMessageId is       "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is   "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    Given "sett105 template" table contains
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |
      | SecuritiesMovementType     | DELI                     |
      | AccountHIN                 | {deliverer}              |
      | SettlementAmount_CdtDbtInd | CRDT                     |
      | OverrideBOMs               | <DeliOBOMs>              |

    And "{delivererActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt         | {CAPTURE:headerCreateNoMatch1} |
      | relatedFromUic   | {delivererActor}               |
      | relatedToUic     | {operator}                     |
      | relatedBizMsgIdr | {delivererMessageId}           |
      | TransactionId    | {delivererTransactionId}       |
      | Reason           | Unmatched                      |

    And "headerCreateNoMatch1" should be within 1 minute of current wall clock time

    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    When "{receiverActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {receiverMessageId}     |
      | TransactionId              | {receiverTransactionId} |
      | SecuritiesMovementType     | RECE                    |
      | AccountHIN                 | {receiver}              |
      | SettlementAmount_CdtDbtInd | DBIT                    |
      | OverrideBOMs               | <ReceOBOMs>             |

    And "{receiverActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt         | {CAPTURE:headerCreateNoMatch2} |
      | relatedFromUic   | {receiverActor}                |
      | relatedToUic     | {operator}                     |
      | relatedBizMsgIdr | {receiverMessageId}            |
      | TransactionId    | {receiverTransactionId}        |
      | Reason           | Unmatched                      |

    And "headerCreateNoMatch1" should be within 1 minute of current wall clock time

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_110"

    @SPD-2422
    Examples:
      | AC            | DeliOBOMs       | ReceOBOMs       | Description                                                                                   |
      | SPD-2422-AC01 | CBNS,CDIV, CCRT | CBNS,XDIV, XCRT | oBOMs provided. Determined Basis of Movements are not the same, results in no match           |
      | SPD-2422-AC01 |                 | CBNS,XDIV, XCRT | No oBom provided on DELI. Determined Basis of Movements are not the same, results in no match |
      | SPD-2422-AC01 | XBNS,CDIV, XCRT |                 | No oBom provided on RECE. Determined Basis of Movements are not the same, results in no match |


  Scenario Outline: <AC> - BOM Match - <Description>
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And delivererMessageId is     "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And receiverMessageId is       "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is   "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue      |           |                         |                      |             |
      | 00703                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | CashDividend    |           |                         |                      |             |
      | 00706                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | DecreaseInValue | N         |                         |                      |             |
      # The last corporate action is not concurrent with first 3.
      | 00707                  | 123        | 2019-02-26 | 2019-02-28 | 2019-03-01  | DividendOption  |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    Given "sett105 template" table contains
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |
      | SecuritiesMovementType     | DELI                     |
      | AccountHIN                 | {deliverer}              |
      | SettlementAmount_CdtDbtInd | CRDT                     |
      | OverrideBOMs               | <DeliOBOMs>              |

    And "{delivererActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt         | {CAPTURE:headerCreateNoMatch1} |
      | relatedFromUic   | {delivererActor}               |
      | relatedToUic     | {operator}                     |
      | relatedBizMsgIdr | {delivererMessageId}           |
      | TransactionId    | {delivererTransactionId}       |
      | Reason           | Unmatched                      |

    And "headerCreateNoMatch1" should be within 1 minute of current wall clock time

    And "{receiverActor}" should receive a "BMW/sett110" message with values:
      | CounterpartyTransactionId  | {delivererTransactionId} |
      | ISIN                       | {IGNORE}                 |
      | SecurityRefCode            | {IGNORE}                 |
      | SettlementQuantity         | {settlmQty}              |
      | TransactionBasis           | {txBasisCode}            |
      | SettlementTxCondition      | {transactionCondition}   |
      | DeliveringActorId          | {delivererActor}         |
      | ReceivingActorId           | {receiverActor}          |
      | SettlementAmount_Amt       | {IGNORE}                 |
      | SettlementAmount_CdtDbtInd | {IGNORE}                 |
      | OverrideBOMs               | <DeliOBOMs>              |
      | TradeDate                  | {tradeDate}              |

    When "{receiverActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {receiverMessageId}     |
      | TransactionId              | {receiverTransactionId} |
      | SecuritiesMovementType     | RECE                    |
      | AccountHIN                 | {receiver}              |
      | SettlementAmount_CdtDbtInd | DBIT                    |
      | OverrideBOMs               | <ReceOBOMs>             |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_106"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_106"

    @SPD-2422
    Examples:
      | AC            | DeliOBOMs       | ReceOBOMs        | Description                                                                                     |
      | SPD-2422-AC02 | CBNS,CDIV,CCRT  | CBNS, CDIV, CCRT | AC 02: oBOMs provided both times. Determined Basis of Movement are the same, results in a match |
      | SPD-2422-AC02 |                 | CBNS, CDIV, CCRT | AC 02: no oBOMs provided on DELI. Determined Basis of Movement are the same, results in a match |
      | SPD-2422-AC03 | CBNS,CDIV, CCRT | CDIV, CCRT, CBNS | AC 03: Basis of Movement are provided in different orders but are the same, results in a match  |


  # Cum Entitlement Transfer
  Scenario: SPD-2423-AC01 - One or more Basis of Movement is "cum" successfully transfers CEB Units.
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And delivererMessageId is     "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And receiverMessageId is       "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is   "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue    |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    Given "sett105 template" table contains
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |
      | SecuritiesMovementType     | DELI                     |
      | AccountHIN                 | {deliverer}              |
      | SettlementAmount_CdtDbtInd | CRDT                     |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 123        | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb700SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 00700             | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |


    And "{delivererActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt         | {CAPTURE:headerCreateNoMatch1} |
      | relatedFromUic   | {delivererActor}               |
      | relatedToUic     | {operator}                     |
      | relatedBizMsgIdr | {delivererMessageId}           |
      | TransactionId    | {delivererTransactionId}       |
      | Reason           | Unmatched                      |

    And "headerCreateNoMatch1" should be within 1 minute of current wall clock time

    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    When "{receiverActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {receiverMessageId}     |
      | TransactionId              | {receiverTransactionId} |
      | SecuritiesMovementType     | RECE                    |
      | AccountHIN                 | {receiver}              |
      | SettlementAmount_CdtDbtInd | DBIT                    |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_106"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_106"

    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{securitySP}"
    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{ceb700SP}"

    And "{receiverActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity | SecurityId |
      | {receiverActor} | {receiver} | 240          | 123        |

    And "{receiverActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity | CorporateActionId |
      | {receiverActor} | {receiver} | 240          | 00700             |

  @SPD-2423
  @unimplemented
  Scenario: SPD-2423-AC02 - Cum Entitlement Transfer - One or more Basis of Movement is "ex" successfully transfers only Units.

    Given delivererActor is "01440"
    And receiverActor is "01441"
    And topupMessageId is             "{delivererActor}|TOPUP111111111111111111111111"
    And topupTransactionId is         "{delivererActor}|TOPUPTX1111111111111111111111"
    And delivererMessageId is         "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is     "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And delivererMessageId2 is        "{delivererActor}|22222222222222222222222222222"
    And delivererTransactionId2 is    "{delivererActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And receiverMessageId is           "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is       "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is     "{party:scheduler}|PCEB00"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    # settlmQty + settlmQty2 must be > deliverer units at beginning AND
    # settlmQty2 must be <= deliverer units and beginning
    And settlmQty2 is "70"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue    |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    # Top-up the deliverer account with more units but without transferring
    # CEB balances (by overriding it to "ex")
    When "{delivererActor}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {topupMessageId}     |
      | TransactionId     | {topupTransactionId} |
      | SttlmtDt          | 2019-02-20           |
      | SttlmTxCond       | UDTR                 |
      | SecurityRefCode   | CBA                  |
      | SettlmQty         | 100                  |
      | DeliveringHIN     | 0010000008           |
      | TransactionBasis  | MRKT                 |
      | DeliveringActorId | {delivererActor}     |
      | ReceivingActorId  | {delivererActor}     |
      | ReceivingHIN      | 0010000007           |
      | OverrideBOMs      | XBNS                 |

    Given "sett105 template" table contains
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | <nil>                        |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | {transactionCondition}       |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | {settlementAmount_Amt}       |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |
      | SecuritiesMovementType     | DELI                     |
      | AccountHIN                 | {deliverer}              |
      | SettlementAmount_CdtDbtInd | CRDT                     |
      | OverrideBOMs               | XBNS                     |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                                   |
      | {delivererActor} | {deliverer} | {settlmQty}  | 123        | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt         | {CAPTURE:headerCreateNoMatch1} |
      | relatedFromUic   | {delivererActor}               |
      | relatedToUic     | {operator}                     |
      | relatedBizMsgIdr | {delivererMessageId}           |
      | TransactionId    | {delivererTransactionId}       |
      | Reason           | Unmatched                      |

    And "headerCreateNoMatch1" should be within 1 minute of current wall clock time

    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    When "{receiverActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {receiverMessageId}     |
      | TransactionId              | {receiverTransactionId} |
      | SecuritiesMovementType     | RECE                    |
      | AccountHIN                 | {receiver}              |
      | SettlementAmount_CdtDbtInd | DBIT                    |
      | OverrideBOMs               | XBNS                    |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_106"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_106"

    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{securitySP}"

    And "{receiverActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{IGNORE}" and values:
      | ActorParty      | AccountId  | UnitQuantity | SecurityId |
      | {receiverActor} | {receiver} | 240          | 123        |

    # Now try to do another BDSI with "ex" determined on CEBs. Should succeed
    # because there are enough units in the account. Wouldn't success if
    # CEB balances _had_ been transferred in previous transaction.

    When "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | bmwBizMsgIdr               | {delivererMessageId2}     |
      | TransactionId              | {delivererTransactionId2} |
      | SecuritiesMovementType     | DELI                      |
      | AccountHIN                 | {deliverer}               |
      | SettlementAmount_CdtDbtInd | CRDT                      |
      | SettlementQuantity         | {settlmQty2}              |
      | OverrideBOMs               | XBNS                      |


    Then "{delivererActor}" receives a "BMW" message with schema location matching "sett_109"

  @SPD-2426
  Scenario: SPD-2426-AC01 - One or more Basis of Movement is "cum" and is cancelled results in units unlocked.
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And delivererMessageId is      "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is  "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And receiverMessageId is        "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is    "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And messageId107 is            "{delivererActor}|11111111111111111111111111112"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue    |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "sett105 template" table contains
      | SecuritiesMovementType     | {securitiesMovementType}     |
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | {supplementaryRef}           |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | AccountHIN                 | {deliverer}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | BDSI                         |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | 100100                       |
      | SettlementAmount_CdtDbtInd | CRDT                         |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    And "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | SecuritiesMovementType     | DELI                     |
      | SettlementAmount_CdtDbtInd | CRDT                     |
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_109"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 123        | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb700SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 00700             | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    When "{delivererActor}" sends a "BMW/sett107" message with values:
      | TransactionId          | {delivererTransactionId} |
      | SecuritiesMovementType | DELI                     |
      | Payment                | APMT                     |
      | SafekeepingAccount     | {deliverer}              |
      | bmwBizMsgIdr           | {messageId107}           |

    Then "{delivererActor}" should receive a "BMW/sett108" message with values:
      #Participant 1
      | bmwCreDt                | {CAPTURE:headerCreateUnlock1} |
      | relatedFromUic          | {delivererActor}              |
      | relatedToUic            | 00001                         |
      | relatedBizMsgIdr        | {messageId107}                |
      | CancellingTransactionId | {IGNORE}                      |
      | TargetTransactionId     | {delivererTransactionId}      |
      | SecuritiesMovementType  | DELI                          |
      | Payment                 | APMT                          |
      | CancellationReason      | CANI                          |

    And "{receiverActor}" should receive a "BMW/sett122" message with values:
      | bmwCreDt               | {CAPTURE:headerCreateUnlock2} |
      | SecuritiesMovementType | DELI                          |
      | TargetTransactionId    | {delivererTransactionId}      |

    And "headerCreateUnlock1" should be within 1 minute of current wall clock time
    And "headerCreateUnlock2" should be within 1 minute of current wall clock time

    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{securitySP}"
    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{ceb700SP}"

  @SPD-2426
  Scenario: SPD-2426-AC02 - One or more Basis of Movement is "cum" and is cancelled from Housekeeping (CUDT) job results in units unlocked.
    Given delivererActor is "01440"
    And receiverActor is "01441"
    And delivererMessageId is      "{delivererActor}|11111111111111111111111111111"
    And delivererTransactionId is  "{delivererActor}|AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    And receiverMessageId is        "{receiverActor}|22222222222222222222222222222"
    And receiverTransactionId is    "{receiverActor}|BBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And cudtSchedulerMessageId is "{party:scheduler}|CUDT00"
    And messageId107 is            "{delivererActor}|11111111111111111111111111111"
    And deliverer is "0010000007"
    And receiver is "0010000015"
    And supplementaryRef is "TRF100"
    And participantRef is "/PRTY/TRF100"
    And underlyingRef is "/UNDR/TRF100"
    And securityRefCode is "CBA"
    And transactionBasis is "MRKT"
    And settlmQty is "40"
    And transactionCondition is "BDSI"
    And partialSettlementIndicator is "NPAR"
    And txBasisCode is "MRKT"
    And settlementDateCode is "ONDE"
    And tradeDate is "2019-02-20"
    And currency is "AUD"
    And settlementAmount_Amt is "1000"
    And payment is "APMT"
    And securitiesMovementType is "DELI"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode | selective | renounceableEntitlement | acceleratedOfferType | buyBackType |
      | 00700                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-26  | BonusIssue    |           |                         |                      |             |

    # The cebDate of the corporate-actions are calculated as 2019-02-20.
    # The date ensures that we are now in the ex-period for those CAs
    And today is 2019-02-21

    # This causes the generation of CEB balances.
    # TODO: Extend loader to also handle entitlement balances
    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "sett105 template" table contains
      | SecuritiesMovementType     | {securitiesMovementType}     |
      | Payment                    | {payment}                    |
      | TradeDate                  | {tradeDate}                  |
      | SettlementDate             | <nil>                        |
      | SettlementDateCode         | {settlementDateCode}         |
      | SupplementaryRef           | {supplementaryRef}           |
      | SettlementLinkId           | <nil>                        |
      | ParticipantRef             | {participantRef}             |
      | UnderlyingRef              | {underlyingRef}              |
      | InvestorCapacity           | <nil>                        |
      | SecurityRefCode            | {securityRefCode}            |
      | ISIN                       | <nil>                        |
      | SettlementQuantity         | {settlmQty}                  |
      | AccountHIN                 | {deliverer}                  |
      | TransactionBasis           | {txBasisCode}                |
      | SettlementTxCondition      | BDSI                         |
      | DeliveringActorId          | {delivererActor}             |
      | ReceivingActorId           | {receiverActor}              |
      | CounterpartyHIN            | <nil>                        |
      | PartialSettlementIndicator | {partialSettlementIndicator} |
      | Currency                   | {currency}                   |
      | SettlementAmount_Amt       | 100100                       |
      | SettlementAmount_CdtDbtInd | CRDT                         |
      | OverrideTolerance_Amt      | <nil>                        |
      | SecondaryMatching          | <nil>                        |

    And "{delivererActor}" sends an "BMW/sett105" message with values merged with "sett105 template":
      | SecuritiesMovementType     | DELI                     |
      | SettlementAmount_CdtDbtInd | CRDT                     |
      | bmwBizMsgIdr               | {delivererMessageId}     |
      | TransactionId              | {delivererTransactionId} |

    And "{delivererActor}" receives a "BMW" message with schema location matching "sett_109"
    And "{receiverActor}" receives a "BMW" message with schema location matching "sett_110"

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:securitySP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | SecurityId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 123        | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    And "{delivererActor}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:ceb700SP}" and values:
      | ActorParty       | AccountId   | UnitQuantity | CorporateActionId | Locked                                                   |
      | {delivererActor} | {deliverer} | 60           | 00700             | SettlementLock:{delivererTransactionId}:{settlmQty}: : ; |

    And today is 2019-02-22

    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {cudtSchedulerMessageId} |
      | EventCode    | CUDT                     |

    Then "{party:scheduler}" should receive multiple "BMW/inte901" messages with values:
      | OrigBizMsgIdr            | StatusCode |
      | {cudtSchedulerMessageId} | ACCP       |
      | {cudtSchedulerMessageId} | COMP       |

    And "{delivererActor}" should receive a "BMW/sett109" message with values:
      | bmwCreDt      | {CAPTURE:headerCreateUnlock1} |
      | related       | absent                        |
      | TransactionId | {delivererTransactionId}      |
      | Reason        | Housekeeping                  |

    And "{receiverActor}" should receive a "BMW/sett122" message with values:
      | bmwCreDt               | {CAPTURE:headerCreateUnlock2} |
      | SecuritiesMovementType | DELI                          |
      | TargetTransactionId    | {delivererTransactionId}      |

    And "headerCreateUnlock1" should be within 1 minute of current wall clock time
    And "headerCreateUnlock2" should be within 1 minute of current wall clock time

    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{securitySP}"
    And "{delivererActor}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{ceb700SP}"


  # AC 03 for SPD-2426 is dependent on Account Locks SPD-2425.
  # @SPD-2426


  #Feature for Participant to Issuer
  #Basis of Movement Determination
  Scenario Outline: <AC> - Using Hold211 message - <Description>
    Given deliverer is "01440"
    And hold211TxnId is "{deliverer}\|11111111111111111111111111111"
    And bmwBizMsgIdr is "{deliverer}\|1111"
    And securitiesMovementType is "DELI"
    And payment is "FREE"
    And movementReason is "BLTR"
    And securityRefCode is "CBA"
    And iSIN is "AU0000CBA123"
    And settlmQty is "100"
    And deliveringAccount is "0010000008"
    And transactionBasis is "FNRT"
    And settlementTransactionCondition is "PCVI"
    And issuer is "75001"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective |
      | 00001                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |
      | 00002                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |
      | 00003                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |

    And today is 2019-02-21

    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00001               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00002               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00003               |

    When "{deliverer}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {deliverer}\|2222                          |
      | TransactionId     | {deliverer}\|22222222222222222222222222222 |
      | SttlmtDt          | 2019-02-24                                 |
      | SecurityRefCode   | {securityRefCode}                          |
      | SettlmQty         | 50                                         |
      | DeliveringHIN     | 0010000007                                 |
      | ReceivingHIN      | 0010000008                                 |
      | TransactionBasis  | MRKT                                       |
      | SttlmTxCond       | UDTR                                       |
      | DeliveringActorId | {deliverer}                                |
      | ReceivingActorId  | {deliverer}                                |
      | SupplementaryRef  | TRF200                                     |
      | ParticipantRef    | /PRTY/TRF100                               |
      | UnderlyingRef     | /UNDR/TRF300                               |
      | OverrideBOMs      | XDIV,XBNS,XCRT                             |

    And "{deliverer}" receives a "BMW" message with schema location matching "hold_202"

    And "hold211 template" table contains
      | bmwBizMsgIdr                   | {deliverer}\|1111                          |
      | TransactionId                  | {deliverer}\|11111111111111111111111111111 |
      | SecuritiesMovementType         | {securitiesMovementType}                   |
      | Payment                        | {payment}                                  |
      | MovementReason                 | {movementReason}                           |
      | SecurityRefCode                | {securityRefCode}                          |
      | ISIN                           | {iSIN}                                     |
      | UnitQuantity                   | {settlmQty}                                |
      | DeliveringAccountID            | {deliveringAccount}                        |
      | TransactionBasis               | {transactionBasis}                         |
      | SettlementTransactionCondition | {settlementTransactionCondition}           |
      | DeliveringParticipant          | {deliverer}                                |
      | ReceivingParticipant           | {issuer}                                   |

    When "{deliverer}" sends an "BMW/hold211" message with values merged with "hold211 template":
      | OBOM1    | <oBOM1>   |
      | OBOM2    | <oBOM2>   |
      | OBOM3    | <oBOM3>   |
      | <Attr 1> | <Value 1> |

    Then "{deliverer}" should receive a "BMW/comm808" message with values:
      | RelatedReference  | {deliverer}\|1111    |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @SPD-2944
    @unimplemented
    Examples:
      | AC            | oBOM1 | oBOM2 | oBOM3 | Attr 1       | Value 1 | Reject Reason | Reject Description                                                                                    | Description                                                                                             |
      | SPD-2944-AC01 |       |       |       | UnitQuantity | 101     | 1084          | Requested quantity is greater than the available balance in '{deliveringAccount}'                     | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN                           |
      | SPD-2944-AC02 | CDIV  | CBNS  | CCRT  | UnitQuantity | 101     | 1084          | Requested quantity is greater than the available balance in '{deliveringAccount}'                     | Nack, oBOM provided as 'cum' and insufficient CEB Units available in Delivering HIN                     |
      | SPD-2944-AC03 | CDIV  | CDIV  | CCRT  |              |         | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CDIV' value is invalid              | Nack, two or more Override Basis of Movement                                                            |
      | SPD-2944-AC04 | CDIV  | XDIV  | CCRT  |              |         | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'XDIV' value is invalid              | Nack, two or more Override Basis of Movement with the same final three letters                          |
      | SPD-2944-AC05 | CDIV  | CBNS  | CINT  |              |         | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CINT' value is invalid              | Nack, One or more Override Basis of Movement do not correspond to the BOM Type of a Corporate Action Id |
      | SPD-2944-AC06 | CDIV  | CXXX  | CCRT  |              |         | 1002          | /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id 'CXXX' value is invalid              | Nack, isn't a valid BOM Code on the BOQ/BOM Table                                                       |
      | SPD-2944-AC07 | CDIV  | CBNS  |       |              |         | 1144          | Additional instances of /BizMsg/Document/SctiesSttlmTxInstr/TradDtls/TradTxCond/Prtry/Id are expected | Nack, There are less Override Basis of Movement than Corporate Action Ids                               |


  Scenario Outline: <AC> - Using inte923 message - <Description>
    Given deliverer is "01440"
    And hold211TxnId is "{deliverer}\|11111111111111111111111111111"
    And bmwBizMsgIdr is "{deliverer}\|1111"
    And securitiesMovementType is "DELI"
    And payment is "FREE"
    And movementReason is "BLTR"
    And securityRefCode is "CBA"
    And iSIN is "AU0000CBA123"
    And settlmQty is "100"
    And deliveringAccount is "0010000008"
    And transactionBasis is "FNRT"
    And settlementTransactionCondition is "PCVI"
    And issuer is "75001"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective |
      | 00001                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |
      | 00002                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |
      | 00003                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |

    And today is 2019-02-21

    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00001               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00002               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | {settlmQty}         |
      | CorporateActionId | 00003               |

    When "{deliverer}" sends an "BMW/hold201" message with values:
      | bmwBizMsgIdr      | {deliverer}\|2222                          |
      | TransactionId     | {deliverer}\|22222222222222222222222222222 |
      | SttlmtDt          | 2019-02-24                                 |
      | SecurityRefCode   | {securityRefCode}                          |
      | SettlmQty         | 50                                         |
      | DeliveringHIN     | 0010000007                                 |
      | ReceivingHIN      | 0010000008                                 |
      | TransactionBasis  | MRKT                                       |
      | SttlmTxCond       | UDTR                                       |
      | DeliveringActorId | {deliverer}                                |
      | ReceivingActorId  | {deliverer}                                |
      | SupplementaryRef  | TRF200                                     |
      | ParticipantRef    | /PRTY/TRF100                               |
      | UnderlyingRef     | /UNDR/TRF300                               |
      | OverrideBOMs      | XDIV,XBNS,XCRT                             |

    And "{deliverer}" receives a "BMW" message with schema location matching "hold_202"

    And transactionId923 is "{party:uiOps}\|4444200"

    When the "{party:uiOps}" sends a "BMW/inte923" message with values:
      | TransactionId         | {transactionId923}      |
      | MovementReason        | ASXO                    |
      | ExecutionTime         | IMME                    |
      | EffectiveDate         | 2019-02-21              |
      | deliveringAccountId   | {deliveringAccount}     |
      | lockedReason          | ASXL                    |
      | deliveringParticipant | {deliverer}             |
      | ConversionType        | AHCV                    |
      | SecurityRefCode1      | {securityRefCode}       |
      | isin                  | {iSIN}                  |
      | UnitQty               | 101                     |
      | bmwBizMsgIdr          | {deliverer}\|0123456789 |

    Then "{party:uiOps}" should receive a "BMW/comm808" message with values:
      | bmwRltd           | {IGNORE}             |
      | RelatedReference  | {transactionId923}   |
      | RejectionReason   | <Reject Reason>      |
      | ReasonDescription | <Reject Description> |

    @unimplemented
    @SPD-2944
    Examples:
      | AC            | Reject Reason | Reject Description                                                                | Description                                                                   |
      | SPD-2944-AC01 | 1084          | Requested quantity is greater than the available balance in '{deliveringAccount}' | Nack, no oBOM provided and insufficient CEB Units available in Delivering HIN |


  Scenario Outline: <AC> - Using hold211 message - <Description>
    Given deliverer is "01440"
    And hold211TxnId is "{deliverer}\|11111111111111111111111111111"
    And bmwBizMsgIdr is "{deliverer}\|1111"
    And securitiesMovementType is "DELI"
    And payment is "FREE"
    And movementReason is "BLTR"
    And securityRefCode is "CBA"
    And iSIN is "AU0000CBA123"
    And settlmQty is "50"
    And deliveringAccount is "0010000008"
    And transactionBasis is "FNRT"
    And settlementTransactionCondition is "PCVI"
    And issuer is "75001"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective |
      | 00001                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |
      | 00002                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |
      | 00003                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |

    And today is 2019-02-21

    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid                   | ActorParty  | AccountId           | CorporateActionId | UnitQuantity |
      | {CAPTURE:account1CEB} | {deliverer} | {deliveringAccount} | 00001             | 100          |
      | {CAPTURE:account2CEB} | {deliverer} | {deliveringAccount} | 00002             | 100          |
      | {CAPTURE:account3CEB} | {deliverer} | {deliveringAccount} | 00003             | 100          |

    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid                         | Issuer   | AccountId           | CorporateActionId | Total | Available |
      | {CAPTURE:account1issuerCEB} | {issuer} | {deliveringAccount} | 00001             | 100   | 100       |
      | {CAPTURE:account2issuerCEB} | {issuer} | {deliveringAccount} | 00002             | 100   | 100       |
      | {CAPTURE:account3issuerCEB} | {issuer} | {deliveringAccount} | 00003             | 100   | 100       |

    When "{deliverer}" sends an "BMW/hold211" message with values:
      | bmwBizMsgIdr                   | {deliverer}\|1111                          |
      | TransactionId                  | {deliverer}\|11111111111111111111111111111 |
      | SecuritiesMovementType         | {securitiesMovementType}                   |
      | Payment                        | {payment}                                  |
      | MovementReason                 | {movementReason}                           |
      | SecurityRefCode                | {securityRefCode}                          |
      | ISIN                           | {iSIN}                                     |
      | UnitQuantity                   | {settlmQty}                                |
      | DeliveringAccountID            | {deliveringAccount}                        |
      | TransactionBasis               | {transactionBasis}                         |
      | SettlementTransactionCondition | {settlementTransactionCondition}           |
      | DeliveringParticipant          | {deliverer}                                |
      | ReceivingParticipant           | {issuer}                                   |
      | OBOM1                          | <first_oBOM1>                              |
      | OBOM2                          | <first_oBOM2>                              |
      | OBOM3                          | <first_oBOM3>                              |

    And "hold216 template" table contains
      #  body
      | TransactionId          | {deliverer}\|11111111111111111111111111111 |
      | SecuritiesMovementType | {securitiesMovementType}                   |
      | Payment                | {payment}                                  |
      | SupplementaryReference | <nil>                                      |
      | SettlementDateCode     | ONDE                                       |
      | InvestorCapacity       | <nil>                                      |
      | MovementReason         | {movementReason}                           |
      | ISIN                   | {iSIN}                                     |
      | SecurityRefCode        | {securityRefCode}                          |
      | SecurityType           | INFO                                       |
      | APIRCode               | <nil>                                      |
      | UnitQuantity           | {settlmQty}                                |
      | DeliveringAccountID    | {deliveringAccount}                        |
      | TransactionBasis       | {transactionBasis}                         |
      | SttlmTxCond            | {settlementTransactionCondition}           |
      | DeliveringParticipant  | {deliverer}                                |
      | ReceivingParticipant   | {issuer}                                   |
      | ReceivingAccountID     |                                            |
      | OBOM1                  | <second_oBOM1>                             |
      | OBOM2                  | <second_oBOM2>                             |
      | OBOM3                  | <second_oBOM3>                             |

    Then "{deliverer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | NewTotalHoldingBalance | 50 |

    And "{issuer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | related               | absent              |
      | RegistrationReference | {deliveringAccount} |

    And "{deliverer}" should observe the archival of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with contract ids "{account1CEB},{account2CEB},{account3CEB}"
    And "{deliverer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding_V001.Holding" with values:
      | cid      | ActorParty  | AccountId           | CorporateActionId | UnitQuantity |
      | {IGNORE} | {deliverer} | {deliveringAccount} | 00001             | 50           |
      | {IGNORE} | {deliverer} | {deliveringAccount} | 00002             | 50           |
      | {IGNORE} | {deliverer} | {deliveringAccount} | 00003             | 50           |

    And "{issuer}" should observe the archival of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with contract ids "{account1issuerCEB},{account2issuerCEB},{account3issuerCEB}"
    And "{issuer}" should observe the creation of multiple "DA.ASX.API.Holding.Holding2Issuer_V001.Holding" with values:
      | cid      | Issuer   | AccountId           | CorporateActionId | Total | Available |
      | {IGNORE} | {issuer} | {deliveringAccount} | 00001             | 50    | 50        |
      | {IGNORE} | {issuer} | {deliveringAccount} | 00002             | 50    | 50        |
      | {IGNORE} | {issuer} | {deliveringAccount} | 00003             | 50    | 50        |

    @SPD-2944 @SPD-6473 @SPD-6474 @SPD-6475 @SPD-6476
    Examples:
      | AC                                                                        | first_oBOM1 | first_oBOM2 | first_oBOM3 | second_oBOM1 | second_oBOM2 | second_oBOM3 | Description                                         |
      | SPD-2944-AC08, SPD-6473-AC01, SPD-6474-AC01, SPD-6475-AC01, SPD-6476-AC01 | CDIV        | CBNS        | CCRT        | CDIV         | CBNS         | CCRT         | Ack, A "cum" Override Basis of Movement is provided |
      | SPD-2944-AC10, SPD-6473-AC01, SPD-6474-AC01, SPD-6475-AC01, SPD-6476-AC01 |             |             |             | <nil>        | <nil>        | <nil>        | Ack, No Override Basis of Movement is provided      |


  Scenario Outline: <AC> - Using inte923 message, AC 8 and 10.
    Given deliverer is "01440"
    And hold211TxnId is "{deliverer}\|11111111111111111111111111111"
    And bmwBizMsgIdr is "{deliverer}\|1111"
    And securitiesMovementType is "DELI"
    And payment is "FREE"
    And movementReason is "ASXO"
    And securityRefCode is "CBA"
    And iSIN is "AU0000CBA123"
    And settlmQty is "50"
    And deliveringAccount is "0010000008"
    And transactionBasis is "FNRT"
    And settlementTransactionCondition is "PCVI"
    And issuer is "75001"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"
    And lockedReason is "ASXL"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective |
      | 00001                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |
      | 00002                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |
      | 00003                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |

    And today is 2019-02-21

    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account1}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00001               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account2}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00002               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account3}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00003               |

    And transactionId923 is "{party:uiOps}\|4444200"

    When the "{party:uiOps}" sends a "BMW/inte923" message with values:
      | TransactionId         | {transactionId923}      |
      | MovementReason        | ASXO                    |
      | ExecutionTime         | IMME                    |
      | EffectiveDate         | 2019-02-21              |
      | deliveringAccountId   | {deliveringAccount}     |
      | lockedReason          | {lockedReason}          |
      | deliveringParticipant | {deliverer}             |
      | ConversionType        | AHCV                    |
      | SecurityRefCode1      | {securityRefCode}       |
      | isin                  | {iSIN}                  |
      | UnitQty               | {settlmQty}             |
      | bmwBizMsgIdr          | {deliverer}\|0123456789 |

    And "hold216 template" table contains
      #  body
      | TransactionId          | {transactionId923}               |
      | SecuritiesMovementType | {securitiesMovementType}         |
      | Payment                | {payment}                        |
      | SupplementaryReference | <nil>                            |
      | SettlementDateCode     | ONDE                             |
      | InvestorCapacity       | <nil>                            |
      | MovementReason         | {movementReason}                 |
      | ISIN                   | {iSIN}                           |
      | SecurityRefCode        | {securityRefCode}                |
      | SecurityType           | INFO                             |
      | APIRCode               | <nil>                            |
      | UnitQuantity           | {settlmQty}                      |
      | DeliveringAccountID    | {deliveringAccount}              |
      | TransactionBasis       | {transactionBasis}               |
      | SttlmTxCond            | {settlementTransactionCondition} |
      | DeliveringParticipant  | {deliverer}                      |
      | ReceivingParticipant   | {issuer}                         |
      | ReceivingAccountID     |                                  |
      | LockedReason           | {lockedReason}                   |
      | related                | absent                           |
      | OBOM1                  | <second_oBOM1>                   |
      | OBOM2                  | <second_oBOM2>                   |
      | OBOM3                  | <second_oBOM3>                   |

    Then "{deliverer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | NewTotalHoldingBalance | 50 |

    And "{issuer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | RegistrationReference | {deliveringAccount} |

    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{account1}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{account2}"
    And "{party:operator}" should observe the archival of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{account3}"

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 50                  |
      | CorporateActionId | 00001               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 50                  |
      | CorporateActionId | 00002               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 50                  |
      | CorporateActionId | 00003               |

    @SPD-2944
    Examples:
      | AC            | second_oBOM1 | second_oBOM2 | second_oBOM3 | Description                                    |
      | SPD-2944-AC10 | <nil>        | <nil>        | <nil>        | Ack, No Override Basis of Movement is provided |


  Scenario Outline: <AC> - An "ex" Override Basis of Movement is provided-Using hold211 message - <Description>
    Given deliverer is "01440"
    And hold211TxnId is "{deliverer}\|11111111111111111111111111111"
    And bmwBizMsgIdr is "{deliverer}\|1111"
    And securitiesMovementType is "DELI"
    And payment is "FREE"
    And movementReason is "BLTR"
    And securityRefCode is "CBA"
    And iSIN is "AU0000CBA123"
    And settlmQty is "50"
    And deliveringAccount is "0010000008"
    And transactionBasis is "FNRT"
    And settlementTransactionCondition is "PCVI"
    And issuer is "75001"
    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective |
      | 00001                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | BonusIssue      |           |
      | 00002                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | CashDividend    |           |
      | 00003                  | 123        | 2019-02-21 | 2019-02-25 | 2019-02-27  | DecreaseInValue | N         |

    And today is 2019-02-21

    When the "{party:scheduler}" sends a "BMW/inte900" message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account1}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00001               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account2}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00002               |

    And "{party:operator}" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:account3}" and values
      | ActorParty        | {deliverer}         |
      | AccountId         | {deliveringAccount} |
      | UnitQuantity      | 100                 |
      | CorporateActionId | 00003               |

    When "{deliverer}" sends an "BMW/hold211" message with values:
      | bmwBizMsgIdr                   | {deliverer}\|1111                          |
      | TransactionId                  | {deliverer}\|11111111111111111111111111111 |
      | SecuritiesMovementType         | {securitiesMovementType}                   |
      | Payment                        | {payment}                                  |
      | MovementReason                 | {movementReason}                           |
      | SecurityRefCode                | {securityRefCode}                          |
      | ISIN                           | {iSIN}                                     |
      | UnitQuantity                   | {settlmQty}                                |
      | DeliveringAccountID            | {deliveringAccount}                        |
      | TransactionBasis               | {transactionBasis}                         |
      | SettlementTransactionCondition | {settlementTransactionCondition}           |
      | DeliveringParticipant          | {deliverer}                                |
      | ReceivingParticipant           | {issuer}                                   |
      | OBOM1                          | <first_oBOM1>                              |
      | OBOM2                          | <first_oBOM2>                              |
      | OBOM3                          | <first_oBOM3>                              |

    And "hold216 template" table contains
      #  body
      | TransactionId          | {deliverer}\|11111111111111111111111111111 |
      | SecuritiesMovementType | {securitiesMovementType}                   |
      | Payment                | {payment}                                  |
      | SupplementaryReference | <nil>                                      |
      | SettlementDateCode     | ONDE                                       |
      | InvestorCapacity       | <nil>                                      |
      | MovementReason         | {movementReason}                           |
      | ISIN                   | {iSIN}                                     |
      | SecurityRefCode        | {securityRefCode}                          |
      | SecurityType           | INFO                                       |
      | APIRCode               | <nil>                                      |
      | UnitQuantity           | {settlmQty}                                |
      | DeliveringAccountID    | {deliveringAccount}                        |
      | TransactionBasis       | {transactionBasis}                         |
      | SttlmTxCond            | {settlementTransactionCondition}           |
      | DeliveringParticipant  | {deliverer}                                |
      | ReceivingParticipant   | {issuer}                                   |
      | ReceivingAccountID     |                                            |
      | OBOM1                  | <second_oBOM1>                             |
      | OBOM2                  | <second_oBOM2>                             |
      | OBOM3                  | <second_oBOM3>                             |

    Then "{deliverer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | NewTotalHoldingBalance | 50 |

    And "{issuer}" should receive a "BMW/hold216" message with values merged with "hold216 template":
      | related               | absent              |
      | RegistrationReference | {deliveringAccount} |

    Examples:
      | AC            | first_oBOM1 | first_oBOM2 | first_oBOM3 | second_oBOM1 | second_oBOM2 | second_oBOM3 | Description                                        |
      | SPD-2944-AC09 | XDIV        | XBNS        | XCRT        | XDIV         | XBNS         | XCRT         | Ack, A "ex" Override Basis of Movement is provided |

  @SPD-7596
  Scenario: SPD-7596-ACBug - Create Buyback CA (evnt718) RepurchaseOffer - WOW, Buyback Type = EQAC, Selective Indicator = false,  Ex-date=T+1 and Record Date=T+3, Here CEB generation date is T+1 and Create a Rights CA (evnt720) on WOW with renounceable entitlement status = "RENO" and Accelerated offer type = "RPDS",  Ex-date=T and Record Date=T+1, Here CEB generation date is T+2

    Given these corporate-actions exist:
      | corporateActionEventId | securityId | exDate     | recDate    | paymentDate | eventTypeCode   | selective | acceleratedOfferType | buyBackType | intermediatePostingDate | intermediateExpiryDate | intermediateSecurityCode | intermediateIsin |
      | 00718                  | 126        | 2019-02-27 | 2019-03-01 | 2019-03-04  | RepurchaseOffer | N         |                      | EqualAccess |                         |                        |                          |                  |

    And messageId2 is "{party:stp}|ABC124"

    And "{party:stp}" sends an "BMW/evnt720" message with values:
      | bmwBizMsgIdr                | {messageId2} |
      | CorpActEventId              | 00720        |
      | NotificationType            | NEWM         |
      | EventCompletenessStatus     | COMP         |
      | EventConfirmationStatus     | CONF         |
      | ISIN                        | AU0000WOW126 |
      | SecurityRefCode             | WOW          |
      | ExDate                      | 2019-02-27   |
      | RecordDate                  | 2019-03-01   |
      | PaymentDate                 | 2019-03-04   |
      | EventTypeCode               | RHTS         |
      | IntermediateIsin            | AU0000WOW126 |
      | IntermediateExpiryDate      | 2019-02-26   |
      | IntermediatePostingDate     | 2019-02-26   |
      | IntermediateSecurityRefCode | WOW          |
      | AcceleratedOfferType        |              |
      | CorporateActionSubType      | RENI         |
      | TermsMultiplier             | 10           |
      | TermsDivisor                | 1            |
      | PrimaryCurrency             | AUD          |


    And "{party:stp}" should receive a "BMW/inte910" message with values:
      | OrigBizMsgIdr | {messageId2} |
      | CdmDocument   | COAC         |
      | Status        | COMP         |

    And the business date rolls over from "2019-02-20" to "2019-02-27" skipping "2019-02-23, 2019-02-24"

    And pcebSchedulerMessageId is "{party:scheduler}|PCEB00"

    And the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId} |
      | EventCode    | PCEB                     |

    And "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | ACCP                     |

    And "01442" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp2}" and values:
      | ActorParty | AccountId  | UnitQuantity | CorporateActionId |
      | 01442      | 0010000023 | 500          | 00718             |

    And "01442" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp1}" and values:
      | ActorParty | AccountId  | UnitQuantity | CorporateActionId |
      | 01442      | 0010000024 | 1000         | 00718             |

    And "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId} |
      | StatusCode    | COMP                     |

    And "01442" sends an "BMW/hold201" message with values:
      | TransactionId     | 01442\|trans01 |
      | bmwBizMsgIdr      | 01442\|trans01 |
      | RequestingActorId | 01442          |
      | SctiesMvmntTp     | DELI           |
      | Payment           | FREE           |
      | SttlmtDt          | 2019-02-27     |
      | OverrideBOMs      | CQAO,XRTS      |
      | SecurityRefCode   | WOW            |
      | SecurityType      | INFO           |
      | SettlmQty         | 40             |
      | AccountHIN        | 0010000023     |
      | TransactionBasis  | MRKT           |
      | SttlmTxCond       | BDTR           |
      | DeliveringActorId | 01442          |
      | ReceivingActorId  | 01441          |

    And "01442" receives a "BMW" message with schema location matching "hold_207"
    And "01441" receives a "BMW" message with schema location matching "hold_208"

    And the business date rolls over from "2019-02-27" to "2019-02-28" skipping "2019-02-23, 2019-02-24"

    And pcebSchedulerMessageId2 is "{party:scheduler}|PCEB01"

    When the "{party:scheduler}" sends a "BMW/inte900" scheduler message with values:
      | bmwBizMsgIdr | {pcebSchedulerMessageId2} |
      | EventCode    | PCEB                      |

    Then "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId2} |
      | StatusCode    | ACCP                      |

    And "01442" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp4}" and values:
      | ActorParty | AccountId  | UnitQuantity | CorporateActionId |
      | 01442      | 0010000023 | 500          | 00720             |

    And "01442" should observe the creation of "DA.ASX.API.Holding.Holding_V001.Holding" with contract id "{CAPTURE:sp3}" and values:
      | ActorParty | AccountId  | UnitQuantity | CorporateActionId |
      | 01442      | 0010000024 | 1000         | 00720             |

    And "{party:scheduler}" should receive a "BMW/inte901" message with values:
      | OrigBizMsgIdr | {pcebSchedulerMessageId2} |
      | StatusCode    | COMP                      |

    And the business date rolls over from "2019-02-28" to "2019-03-01"
