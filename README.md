# BreatheESG

BreatheESG is a prototype ESG ingestion and emissions review platform built with Django REST Framework and React.

Most ESG reporting problems are data problems.

Different teams export data from different systems:
- SAP reports
- utility billing portals
- travel platforms
- spreadsheets maintained manually

The difficult part is not calculating emissions. It is cleaning inconsistent operational data, normalizing it into a consistent structure, and making it reviewable before audit submission.

This project focuses on that workflow.

---

# Live Links

## Frontend


## Backend API


## GitHub Repository
https://github.com/sakshivbp1812/BreatheESG-Assignment.git

# Demo Credentials

Password: Pass44
|


# What The Platform Does

The platform allows organisations to:

- upload ESG-related operational datasets
- normalize inconsistent records
- classify activities into Scope 1/2/3
- detect suspicious records
- review and approve emissions activity
- maintain audit history

---

# Supported Sources

## 1. SAP Fuel & Procurement Data

Simulated using CSV exports similar to operational SAP reports.

Examples handled:
- German headers
- inconsistent units
- plant codes
- mixed date formats
- procurement references

---

## 2. Utility Electricity Data

Simulated using utility portal exports.

Examples handled:
- billing periods
- kWh/MWh normalization
- tariff metadata
- negative usage credits

---

## 3. Corporate Travel Data

Simulated using travel-management style datasets.

Examples handled:
- flights
- hotels
- ground transport
- travel class multipliers
- missing distances

---

# Main Features

## ESG Dashboard
Overview of:
- uploaded records
- emissions totals
- suspicious records
- review status

---

## Upload & Ingestion
Users can upload CSV datasets for:
- SAP
- Utility
- Travel

Each upload creates an ingestion batch.

---

## Data Normalization
The system converts inconsistent operational records into a common ESG structure.

Examples:
- liters → normalized calculations
- MWh → kWh scaling
- mixed date formats → ISO dates

---



## Validation & Flagging

The platform flags:
- negative values
- future-dated records
- malformed units
- suspicious quantities
- incomplete travel records

---

## Analyst Review Workflow

Analysts can:
- approve records
- reject records
- flag records
- add review comments

Approved records become locked for audit consistency.

---

## Audit Logging

The system tracks:
- uploads
- review actions
- approvals
- timestamps
- source lineage

---

# Tech Stack

## Frontend
- React
- Vite
- Tailwind CSS
- Axios

## Backend
- Django
- Django REST Framework
- JWT Authentication

## Database
- PostgreSQL (Production)
- SQLite (Local)

## Deployment
- Vercel
- Render

---

# Local Setup

## Backend

```bash
cd backend

pip install -r requirements.txt

python manage.py migrate

python seed.py

python manage.py runserver
```

Backend:
http://localhost:8000

---

## Frontend

```bash
cd frontend

npm install

npm run dev
```

Frontend:
http://localhost:5173

---

# API Endpoints

| Method | Endpoint |
|---|---|
| POST | /api/auth/login/ |
| GET | /api/dashboard/ |
| POST | /api/uploads/ |
| GET | /api/records/ |
| GET | /api/audit-logs/ |

---



# Design Priorities

This project intentionally focused on:
- ingestion clarity
- auditability
- source traceability
- realistic ESG workflows
- analyst usability

instead of:
- complex infrastructure
- microservices
- real-time integrations
- over-engineered architecture

---

# Future Improvements

Possible production-scale improvements:
- asynchronous ingestion workers
- OCR utility invoice extraction
- live ERP integrations
- configurable emission factor registries
- workflow notifications
- schema versioning


