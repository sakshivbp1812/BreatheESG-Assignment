
# How I Researched The Source Formats

I spent time looking at how these systems actually export operational data instead of creating unrealistic toy datasets.

The sample files were intentionally designed to include:
- inconsistent headers
- mixed units
- formatting issues
- missing values
- review edge cases

because real onboarding data is usually messy.

---

# 1. SAP Fuel & Procurement Data

## What I Looked At

I reviewed:
- SAP export examples
- procurement reports
- ERP operational CSV structures

I noticed that sustainability onboarding often starts with:
- exported spreadsheets
- manually shared CSV files
- finance-generated operational reports

rather than direct ERP integrations.

---

## What The Sample Data Includes

The SAP sample data intentionally includes:
- German column headers
- plant codes
- mixed date formats
- inconsistent units
- procurement references

Example fields:
- `Buchungsdatum`
- `Werk`
- `Menge`
- `Einheit`

---

## What Would Break In Production

A real deployment would likely require:
- ERP authentication
- scheduled sync jobs
- mapping layers
- custom unit registries

Large uploads would also need async processing.

---

# 2. Utility Electricity Data

## What I Looked At

I reviewed:
- utility billing exports
- facilities reporting examples
- commercial electricity datasets

I found that facilities teams commonly work with:
- CSV exports
- portal downloads
- billing summaries

instead of APIs.

---

## What The Sample Data Includes

The utility sample data includes:
- billing periods
- kWh usage
- tariff metadata
- account numbers
- negative usage values

to simulate:
- credits
- corrections
- billing irregularities

---

## What Would Break In Production

A production utility ingestion system would likely require:
- OCR pipelines
- utility-specific connectors
- estimated-reading handling
- reconciliation workflows

---

# 3. Corporate Travel Data

## What I Looked At

I reviewed:
- Concur export examples
- Navan-style travel payloads
- travel booking workflows

Travel datasets often contain:
- airport codes
- segmented trips
- missing distances
- hotel metadata
- taxi expenses

---

## What The Sample Data Includes

The travel sample data includes:
- flights
- hotel nights
- taxi distances
- travel classes
- incomplete records

First-class flights are intentionally flagged because they have significantly higher emissions factors.

---

## What Would Break In Production

A production system would likely require:
- airport geolocation databases
- route distance calculations
- OAuth integrations
- provider-specific adapters

---

# Final Notes

The datasets were intentionally designed to feel imperfect.

The main goal was to simulate the kinds of operational inconsistencies analysts would actually deal with during ESG onboarding.