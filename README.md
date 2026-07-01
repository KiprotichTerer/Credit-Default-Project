# Credit Default Prediction Project

## Project Overview

This project uses credit client data to build a machine learning model that predicts whether a client will default on their payment in the next month. The workflow includes data preprocessing, exploratory data analysis (EDA), feature engineering, model training, and serving predictions using an XGBoost model.

---
## Data Description

The Default of Credit Clients dataset contains the following features:

### ID
A unique identifier for each client. This column was dropped during preprocessing as it was not relevant for analysis.

### LIMIT_BAL
The amount of credit granted to the client (in NT dollars). This includes both individual and family credit.

### SEX
The gender of the client. Originally encoded as:
- `1`: Male
- `2`: Female

These values were mapped to descriptive labels (`male` and `female`) for clarity.

### EDUCATION
The education level of the client. Originally encoded as numeric values:
- `1`: Graduate
- `2`: University
- `3`: High School
- `4`: Others

These were mapped to descriptive labels for better understanding.

### MARRIAGE
The marital status of the client. Originally encoded as:
- `1`: Married
- `2`: Single
- `3`: Others

Values were mapped to descriptive labels.

### AGE
The client's age in years.

### PAY_0 to PAY_6
Repayment status for the last six months. Originally encoded as:
- `-2`: Not paid duly
- `-1`: Paid duly
- `0`: No delay
- `1`: Payment delay of one month
...
- `9`: Payment delay of nine months or more

These values were mapped to descriptive labels, such as "Paid Duly" and "Delay of X Months," during preprocessing.

### BILL_AMT1 to BILL_AMT6
The bill statement amounts (in NT dollars) for the past six months.

### PAY_AMT1 to PAY_AMT6
The amounts paid by the client (in NT dollars) over the past six months.

### default_payment
The target variable indicating whether the client defaulted on their payment:
- `0`: No default
- `1`: Default

---

## Reference
For additional details about the dataset, refer to the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients).

## Setup and Installation

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/KiprotichTerer/Credit-Default-Project.git
cd Credit-Default-Project
```

### 2. Set Up Virtual Environment
The project uses a Python virtual environment to manage dependencies.

#### Activate the virtual environment
On **Windows**:
```bash
venv\Scripts\activate
```
On **Linux/MacOS**:
```bash
source venv/bin/activate
```

#### Install dependencies
After activating the virtual environment, install the required dependencies:
```bash
pip install -r requirements.txt
```

---

## Running the Project

### 1. Train the Model
Run the `train.py` script to train and save the model:
```bash
python train.py
```

### 2. Serve Predictions
Use the `predict.py` script to serve predictions:
```bash
python predict.py
```

---

## Deployment
This project can be deployed locally using Docker or to the cloud using AWS Elastic Beanstalk. Below are the detailed steps for both methods:

### Deploy Locally with Docker

#### Step 1: Install Docker
Ensure Docker is installed on your system. If not, refer to the [Docker installation guide](https://docs.docker.com/get-docker/).

#### Step 2: Build the Docker Image
Run the following command to create a Docker image for the project:
```bash
docker build -t credit-default .
```

#### Step 3: Run the Docker Container
Start the Docker container and expose it on port `9696`:
```bash
docker run -d -p 9696:9696 --name Credit credit-default
```

#### Step 4: Access the Service
The service will be available at [http://localhost:9696](http://localhost:9696).

### Deploy to AWS Elastic Beanstalk

#### Step 1: Install AWS Elastic Beanstalk CLI
Install the Elastic Beanstalk CLI by following the [AWS EB CLI installation guide](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html).

#### Step 2: Initialize Elastic Beanstalk
In the project directory, run:
```bash
eb init
```
- Choose your AWS region.
- Enter an application name (e.g., `credit-default`).
- Select `Docker` as the platform.
- Set up SSH access if required for troubleshooting.

#### Step 3: Create an Elastic Beanstalk Environment
Create a new environment to host the application:
```bash
eb create credit-card-default-env
```

#### Step 4: Deploy the Application
Use the following command to deploy the project to Elastic Beanstalk:
```bash
eb deploy
```

#### Step 5: Access the Application
Once deployed, Elastic Beanstalk will provide a URL to access your application. You can also use:
```bash
eb open
```

#### Step 6: Monitor and Manage
- To view logs:
```bash
  eb logs
```
- To terminate the environment when no longer needed:
```bash
  eb terminate credit-default-env
```
