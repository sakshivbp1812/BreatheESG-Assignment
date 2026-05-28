
# Data Model Notes

The data model was designed around one main idea:

Raw uploaded data should never be lost.

Every normalized ESG record keeps references to:
- where it came from
- when it was uploaded
- which upload batch produced it
- who reviewed it
- what changed during review

This makes the platform easier to:
- audit
- debug
- review
- replay

---

# Main Entities

## Organisation

Represents a tenant/company using the platform.

All uploaded data is scoped to an organisation to keep datasets isolated.

---

## User

Custom authenticated user model.

### Roles
- Admin
- Analyst
- Viewer

Different roles exist because ESG workflows involve:
- uploads
- reviews
- approvals
- read-only reporting

---

## UploadBatch

Represents a single ingestion event.

Tracks:
- source type
- upload status
- processing state
- failed rows
- uploaded file

This makes ingestion easier to monitor and debug.

---

## RawRecord

Stores the original uploaded payload before normalization.

Keeping raw data separate from normalized records allows:
- replaying ingestion
- tracing parsing issues
- preserving source-of-truth data

---

## EmissionRecord

Stores normalized ESG activity.

Examples:
- fuel usage
- electricity usage
- flights
- hotels
- taxi travel
- procurement activities

Each record contains:
- normalized values
- emission calculations
- scope classification
- review state
- source references

---

## ValidationIssue

Stores validation flags and anomalies.

Examples:
- negative quantities
- invalid dates
- malformed units
- suspicious usage spikes

---

## ReviewAction

Tracks analyst activity:
- approvals
- rejections
- comments
- flags

This creates a review history for audit purposes.

---

## AuditLog

Stores immutable system-level activity logs.

Tracks:
- uploads
- edits
- approvals
- timestamps
- actors

---

# Scope Classification

| Activity Type | Scope |
|---|---|
| Fuel | Scope 1 |
| Electricity | Scope 2 |
| Travel | Scope 3 |
| Procurement | Scope 3 |

---

# Why Multi-Tenancy Was Included

Even though this is a prototype, ESG platforms are naturally multi-tenant systems.

Different organisations need:
- isolated uploads
- isolated review workflows
- isolated audit history

The schema reflects that structure.

---

# Why Raw Data Was Preserved

One of the biggest ingestion mistakes is overwriting source data during normalization.

This project intentionally stores:
- raw uploaded values
- normalized values

separately.

That makes ingestion behavior easier to explain and audit.

---

# Locking Approved Records

Once a record is approved:
- it becomes read-only
- edits are blocked
- review history remains preserved

This prevents accidental modification before audit review.

---

# Things Intentionally Simplified

The model intentionally avoids:
- distributed event systems
- schema registries
- dynamic factor governance
- complex workflow engines

The goal was to keep the ingestion workflow understandable and defendable within the assignment scope.