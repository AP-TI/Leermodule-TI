# Materials Management (MM)
## S/4HANA
- Material document data will be stored in MATDOC
- Material Ledger obligatory
- Output management based on Adobe Document Server and Adobe Forms
- Ariba: source-to-pay process

![mm1](afb/mm1.png)

- Transactions for executing and displaying goods movements are replaced by transaction MIGO

## Organizational Structure

![mm2](afb/mm2.png)

## Master data
- Vendor Master Data
    - info needed to do business with suppliers
    - General data, company code data, purchasing data

- Material Master Data
    - Data about materials
    - Used pretty much everywhere
    - Stored in views

- Purchasing Info Record
    - Relations between vendor and material
    - Create manually or automatically
    - default info for Purchase Orders

- Procure-To-Pay Process
> Purchase requisition -> Vendor selection -> Purchase order -> Notify vendor -> Vendor shipment -> Goods receipt -> Invoice receipt -> Payment to vendor

- Requisition: waar nodig, waar verkrijgbaar?
- Vendor selection: waar verkrijgbaar binnen gegeven termijn?
- Long time agreements: contracts (hoeveelheid en waarde), delivery schedule agreement (1x kopen, komt om de zoveel tijd aan)
- Request for quotation (rfp voor prijs -> ask for a bid) -> bid is legally binding
- Evaluations on given criteria -> price, quality, delivery

![mm3](afb/mm3.png)