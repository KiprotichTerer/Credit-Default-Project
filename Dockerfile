FROM python:3.8-slim

# 2. Set the working directory inside the container to /app
WORKDIR /app

# 3. Copy Pipfile and Pipfile.lock from environment_project to /app
COPY requirements.txt .

# 4. Install dependencies using Pipenv
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the project files from environment_project to /app
COPY predict.py .
Copy dv.pkl .
copy xgb_model.pkl .

EXPOSE 9696

# 7. Command to run the prediction script
CMD ["python", "predict.py"]
