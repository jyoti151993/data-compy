import pandas as pd
import pyodbc
import datacompy,openpyxl

conn=pyodbc.connect(Trusted_Connection='Yes',
    Driver='ODBC Driver 17 for SQL Server',
    Server="JYOTI\SQLEXPRESS",
    Database="datacompy")


query1="select * from Emp1"
df_emp1=pd.read_sql(query1,conn)

query2="select * from Emp2"
df_emp2=pd.read_sql(query2,conn)

conn.close()


""" display the data from df_emp1 
"""
print("data from emp1")
print(df_emp1)


""" display the data from df_emp2
"""
print("data from emp2")
print(df_emp2)


"""comparing the two tables"""

compare=datacompy.core.Compare(df_emp1,df_emp2,
                               join_columns="ID",ignore_spaces=True,
ignore_case=True)

report=compare.report()

with pd.ExcelWriter('comparison_report_v1.xlsx',engine='openpyxl') as writer:
    
    
    # Write the base table (emp1)
    df_emp1.to_excel(writer, sheet_name='Base Table (emp1)', index=False)
    
    # Write the target table (emp2)
    df_emp2.to_excel(writer, sheet_name='Target Table (emp2)', index=False)
    
    # Write the comparison report to a separate sheet
    df_report = pd.DataFrame(report.split('\n'), columns=['Comparison Report'])
    df_report.to_excel(writer, sheet_name='Comparison Report', index=False)
    
    
  
    # Save detailed differences to different sheets
    compare.intersect_rows.to_excel(writer, sheet_name='Matches', index=False)
    compare.df1_unq_rows.to_excel(writer, sheet_name='Unique to emp1', index=False)
    compare.df2_unq_rows.to_excel(writer, sheet_name='Unique to emp2', index=False)
    
    # Mismatched rows
    mismatches = compare.all_mismatch()
    mismatches.to_excel(writer, sheet_name='Mismatches', index=False)