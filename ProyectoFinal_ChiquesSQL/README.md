# Hoteles Luna — Relational Database Design

Final project for the graduate course *Fundamentos de Bases de Datos* (IIMAS,
UNAM, 2024-2). *Co-authored with Ivana Ix Chel Bonilla Negrete and Dylan
Enrique Juárez Martínez.*

Full relational database design for a fictional multi-property hotel chain,
from entity-relationship modeling through DDL, DML, and a set of business-logic
queries.

**Start here:** [`Docs/ReporteEjecutivoChiquesSQL.pdf`](Docs/ReporteEjecutivoChiquesSQL.pdf)
is the executive report covering the full design and findings.
[`Docs/DiccionarioChiquesSQL.pdf`](Docs/DiccionarioChiquesSQL.pdf) is the data
dictionary, and [`Diagramas/`](Diagramas/) has the entity-relationship and
relational diagrams.

## Scope
- **Entity-relationship and relational modeling** for a chain with multiple
  hotels, room types, staff roles, guest memberships, and event/banquet
  bookings.
- **DDL** ([`SQL/DDL.sql`](SQL/DDL.sql)): table creation with referential
  integrity constraints.
- **DML** ([`SQL/DML.sql`](SQL/DML.sql)): seed data for testing and
  demonstration.
- **DQL** ([`SQL/DQL.sql`](SQL/DQL.sql)): 22 queries encoding real business
  questions, for example:
  - Guests with an active membership who have rented a Penthouse room
  - Guests who have booked an event more than once (repeat-customer signal)
  - Staff birthdays next month, ordered by hotel and date
  - The 20 longest-tenured employees across the chain
  - Pet-friendly hotels, and guests with pets who stayed in a Penthouse
  - Hotels with individual room prices above a threshold, ranked by price

## Stack
PostgreSQL (SQL: DDL/DML/DQL). Entity-relationship and relational diagrams
built in draw.io.
