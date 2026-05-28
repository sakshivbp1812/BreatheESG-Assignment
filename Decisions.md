
# Why I Chose These Approaches

This project was built under a short timeline, so I focused on:
- realistic ingestion workflows
- normalization
- auditability
- analyst review flows

instead of trying to simulate a full enterprise ESG platform.

---

# 1. Why CSV Uploads Were Used For SAP

I chose CSV uploads because most ESG onboarding workflows start with operational exports shared by finance or procurement teams.

Direct SAP integrations would add:
- authentication complexity
- infrastructure setup
- ERP-specific implementation details

without improving the ingestion workflow being demonstrated.

The focus of this prototype is:
- parsing
- normalization
- validation
- review

---

# 2. Why Utility Data Uses Structured Exports

Utility invoice OCR is difficult to make reliable.

Different providers format invoices differently, and OCR pipelines can introduce extraction mistakes.

I chose structured utility exports instead because:
- they are easier to validate
- they are more audit-friendly
- they better fit the assignment timeline

---

# 3. Why Travel Data Was Simplified

Real travel platforms expose:
- APIs
- segmented bookings
- airport-based routing

The prototype uses simplified travel exports while still modeling:
- flights
- hotel stays
- ground transport
- travel classes

This kept the ingestion flow understandable without removing realistic travel edge cases.

---

# 4. Why Raw Records Are Stored Separately

I wanted normalized ESG records to remain traceable back to the original uploaded source.

Keeping raw data separate makes it easier to:
- debug parsing issues
- replay ingestion
- preserve source lineage
- explain calculations during review

---

# 5. Why Validation Is Rule-Based

The anomaly detection logic is intentionally simple and explainable.

Examples:
- negative values
- future dates
- suspicious quantities
- malformed units

I avoided ML-based anomaly detection because rule-based systems are:
- easier to audit
- easier to explain
- more realistic for a prototype

---

# 6. Why Synchronous Processing Was Used

Uploads are processed during the request lifecycle.

I intentionally avoided:
- Celery
- Redis
- background workers

because the datasets used in the prototype are small.

Adding async infrastructure would increase:
- deployment complexity
- debugging difficulty
- operational setup

without improving the actual ingestion workflow.

---

# 7. Why Audit Logs Were Included

Auditability is central to ESG reporting.

The platform tracks:
- uploads
- approvals
- review activity
- timestamps
- source references

so that records remain explainable after ingestion.

---

# Final Notes

The goal of this project was not to build a perfect ESG platform.

The goal was to build a believable ingestion and review workflow that reflects the messy nature of real operational sustainability data.