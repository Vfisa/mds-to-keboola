import requests
import zipfile
import os

url = "https://www.zipshare.com/fileDownload/eyJhcmNoaXZlSWQiOiJhZDhlMTQ3OC1hMGI0LTRiOGYtOTdiZC1mMTZjZjM3M2Y3YmIiLCJlbWFpbCI6Im1iaW9tYmFuaXN0ZWZlbkBnbWFpbC5jb20ifQ=="

output_folder = "/data/out/tables/"

archive_path = "archive.zip"

try:
    # Create the output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)

    # Send a GET request to the URL and download the ZIP file
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for any unsuccessful status codes

    # Save the downloaded archive to a file
    with open(archive_path, "wb") as file:
        file.write(response.content)

    # Extract the contents of the ZIP file to the output folder
    with zipfile.ZipFile(archive_path, "r") as zip_ref:
        zip_ref.extractall(output_folder)

    print("Extraction completed successfully!")

except requests.exceptions.RequestException as e:
    print("Error occurred while downloading the ZIP file:", e)

except zipfile.BadZipFile:
    print("The downloaded file is not a valid ZIP archive.")

except Exception as e:
    print("An error occurred during the extraction:", e)

finally:
    # Remove the downloaded archive file
    if os.path.exists(archive_path):
        os.remove(archive_path)

    print("Cleanup completed.")
