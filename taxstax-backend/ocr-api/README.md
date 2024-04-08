# OCR API

OCR (Optical Character Recognition) API to extract relevant information from receipts, such as merchant name, date, and total amount.

## Prerequisites
Python3 with libraries pytesseract, spacy, flask, pillow, gunicorn.

For local testing you also have to install `tesseract`. For Mac you can use `brew install tesseract`.
For spacy you need to run `python -m spacy download en_core_web_sm` before starting the api.

## Getting started

Run locally
- Install files from `requirements.txt` (run `pip install -r requirements.txt`).
- Install Tesseract (see prerequisites)
- Install Spacy (see prerequisites)
- Run main file (`python main.py`).

Run as Docker image
- Build Docker image (`docker build -t <your-tag> .`)
- Run Docker image (`docker run -p <your-local-port>:8000 -it <your-tag>`)