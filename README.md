# DBT-Snowflake-Orchestrator

An end-to-end data transformation pipeline that integrates **dbt**, **Snowflake**, and **Apache Airflow**—all orchestrated within a Dockerized environment.  
This project enables scalable, modular, and testable data workflows for modern data engineering.

---

## 🚀 Overview

This repository combines:

- **dbt (Data Build Tool)**: For SQL-based data transformations.
- **Snowflake**: As the cloud data warehouse.
- **Apache Airflow**: To orchestrate and schedule dbt workflows.
- **Docker**: To containerize and manage the environment.

The architecture follows a modern data stack pattern, separating orchestration and transformation layers to ensure modularity and scalability.

---

## 🧱 System Architecture

The system comprises three primary components:

1. **Airflow Orchestration Layer**:
   - Runs in Docker containers as defined in the repository.
   - Configured with CeleryExecutor for distributed task execution.
   - Manages scheduling and execution of dbt workflows.

2. **dbt Transformation Layer**:
   - Project named `DBT_Snowflake` as configured in `dbt_project.yml`.
   - SQL transformations organized into standard dbt directories.
   - Models split between staging (views) and marts (tables).

3. **Snowflake Data Warehouse**:
   - Stores raw data and transformed datasets.
   - Executes SQL transformations defined in dbt models.

---

## 🔁 Workflow Process

The data transformation process follows a defined workflow:

1. **Orchestration**: Airflow scheduler triggers the dbt DAG.
2. **Transformation**: The DAG executes `dbt run` to transform data.
3. **Validation**: After transformation, `dbt test` validates data quality.
4. **Data Flow**: Data flows from raw sources through staging models (views) to mart models (tables).

---

## 🧩 Key Features

- **Docker-based Deployment**: The entire system runs in Docker containers defined in `docker-compose.yaml`, with a custom Docker image that includes dbt installed with Airflow.
- **Modular Architecture**: Clear separation between orchestration (Airflow) and transformation (dbt) layers, following modern data stack principles.
- **Transformation Best Practices**: Models follow the staging/mart pattern, with staging models materialized as views and mart models as tables:

  ```yaml
  models:
    DBT_Snowflake:
      staging:
        +materialized: view
      marts:
        +materialized: table
  ```
- **Automated Testing**: Built-in data validation with dbt tests, integrated into the Airflow pipeline.
- **Scalable Execution**: Uses Airflow's CeleryExecutor for distributed task execution, allowing the system to scale.

---

## 📁 Project Structure

```plaintext
.
├── dbt_snowflake/
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   ├── macros/
│   ├── dbt_project.yml
│   └── README.md
├── dags/
│   └── dbt_dag.py
├── docker-compose.yaml
├── Dockerfile
└── airflow/
    └── config/
        └── airflow.cfg
```

---

## ⚙️ Setup Instructions

For detailed setup instructions, please refer to the [Getting Started](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/1.2-getting-started) section.

---

## 📚 Additional Resources

- [System Architecture](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/1.1-system-architecture)
- [dbt Project Structure](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/2-dbt-project)
- [Airflow Orchestration](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/3-airflow-orchestration)
- [Project Structure](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/4-project-structure)

---

For more information, visit the [DeepWiki project page](https://deepwiki.com/Sharaf2OO2/DBT-Snowflake-Orchestrator/1-overview).
