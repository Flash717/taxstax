# Base image with Python 3.9
FROM python:3.9

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Install Tesseract OCR engine (assuming system-wide installation)
RUN apt-get update && apt-get install -y tesseract-ocr

# Install Spacy model
RUN python -m spacy download en_core_web_sm

# Expose port for Gunicorndockke
EXPOSE 8000

# Set Gunicorn command with your app entrypoint
CMD ["gunicorn", "-b", "0.0.0.0:8000", "wsgi"]
