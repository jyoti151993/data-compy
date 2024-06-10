# Overview
This Python script compares data from two SQL Server tables (Emp1 and Emp2) and generates a detailed comparison report in an Excel file. The script connects to the database, fetches data from the tables, compares them using the datacompy library, and writes the results to an Excel file.

# Prerequisites
Python 3.x
The following Python libraries:
pandas
pyodbc
datacompy
openpyxl
Installation

# You can install the required libraries using pip:

bash
Copy code
pip install pandas pyodbc datacompy openpyxl
Usage
# Database Connection:

The script connects to a SQL Server database using pyodbc.
Ensure you have the correct connection details (server name, database name).
Fetching Data:

Data from the Emp1 and Emp2 tables is fetched and stored in pandas DataFrames (df_emp1 and df_emp2).
Displaying Data:

# The script prints the data from both DataFrames to the console.
# Comparing Data:

The datacompy library is used to compare the two DataFrames based on the ID column.
The comparison considers case and whitespace differences.

# Generating Report:

The comparison results are written to an Excel file named comparison_report_v2.xlsx.
The Excel file contains the following sheets:
Base Table (emp1): Data from the Emp1 table.
Target Table (emp2): Data from the Emp2 table.
Comparison Report: A text report of the comparison.
Matches: Rows that match between the tables.
Unique to emp1: Rows unique to Emp1.
Unique to emp2: Rows unique to Emp2.
Mismatches: Rows with mismatched data.
