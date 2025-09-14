# Airbnb Data Warehouse Case Study

This repository contains a dimensional data model for analyzing Airbnb booking activity.  
It includes schema design, sample data, analytical views, and example SQL queries.

---

## Repository Structure

├── airbnb schema.png # Schema diagram
├── sql/ # SQL scripts
│ ├── ddl/ # Table creation scripts
│ ├── dml/ # Inserts and sample data
│ ├── views/ # Analytical views
│ └── queries/ # Use-case queries
├── README.md # Documentation

---

## Schema Overview

The schema follows a **star schema** design with fact and dimension tables.

## Fact Tables
- bookings_fact: Stores booking transactions, including users, hosts, properties, payments, and booking details.  
- reviews_fact: Stores user reviews, linked to bookings.

## Dimension Tables
- users_dim: User details such as name, country, and account creation date.  
- hosts_dim: Host details including response rate and location.  
- properties_dim: Property details such as type, location, and capacity.  
- property_type_dim: Standardized property type list.  
- location_dim: City, state, country, and population details.  
- calendar_dim: Calendar attributes for date analysis.  
- payments_dim: Payment method, provider, and transaction status.

---

## Key Features

- Fact vs Dimension Explanation
  - Fact tables store measurable events (bookings, reviews).  
  - Dimension tables provide descriptive attributes (users, hosts, properties, dates).

- Analytical Views  
  Predefined SQL views in `sql/views/` for insights 

- Queries
  Example queries in `sql/queries/` demonstrate practical use cases such as:  
---

## How to Use

1. Create Tables
   Run scripts in `sql/ddl/` to create schema objects.  

2. Insert Sample Data
   Load scripts from `sql/dml/` for sample inserts.  

3. Create Views 
   Execute SQL in `sql/views/` for analytical insights.  

4. Run Queries
   Use SQL files in `sql/queries/` to answer business questions.
