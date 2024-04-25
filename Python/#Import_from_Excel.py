import os
import pandas as pd
from sqlalchemy import create_engine
import shutil 

# Path to the main directory containing subfolders with Excel files
main_dir = r'S:\Shares\ServerStorageHDD\Projects\CarDealer'

# Create SQLAlchemy engine
connection_string = "mssql+pyodbc://WINSERVERDC/Dealerships?driver=ODBC+Driver+17+for+SQL+Server"

engine = create_engine(connection_string)

# Iterate through each folder in the main directory
for folder_name in os.listdir(main_dir):
    folder_path = os.path.join(main_dir, folder_name)
    if os.path.isdir(folder_path):
        scrapes_folder = os.path.join(folder_path, 'Scrapes')
        processed_folder = os.path.join(folder_path, 'ProcessedScrapes') 
        if os.path.exists(scrapes_folder) and os.path.isdir(scrapes_folder):
            print(f"Loading Excel files from folder: {folder_name}")
            excel_files = [file for file in os.listdir(scrapes_folder) if file.endswith('.xlsx')]
            for file in excel_files:
                file_path = os.path.join(scrapes_folder, file)
                df = pd.read_excel(file_path)
                table_name = 'Raw_' + folder_name 
                try:
                    df.to_sql(table_name, con=engine, if_exists='append', index=False)
                    print(f"Data from {file} written to table: {table_name}")
                    processed_file_path = os.path.join(processed_folder, file)
                    shutil.move(file_path, processed_file_path)
                    print(f"{file} moved to ProcessedScrapes folder")
                except Exception as e:
                    print(f"Error occurred while writing {file} to {table_name}: {e}")
