from flask import Flask, request, jsonify
from PIL import Image
import pytesseract
import spacy
import logging
import pdf2image

app = Flask(__name__)

# Set up logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler = logging.StreamHandler()
handler.setFormatter(formatter)
logger.addHandler(handler)

@app.route('/', methods=['GET'])
def index():
    logger.info('Welcome to the OCR API in Docker!')
    return 'Welcome to the OCR API in Docker!', 200

@app.route('/ocr', methods=['POST'])
def ocr_process():
    if request.method == 'POST':
        # requires: python -m spacy download en_core_web_sm
        nlp = spacy.load('en_core_web_sm')

        try:
            image_file = request.files['image']
            image_data = Image.open(image_file)

            logger.debug(f'Image format: {image_data.format}')
        except Exception as e:
            logger.error("Error: ", e)
            return jsonify({
                'status': 'error',
                'message': 'An error occurred while loading the image: ' + str(e)
            }), 500

        # Perform OCR using PyTesseract
        try:
            image_text = pytesseract.image_to_string(image_data)
            doc = nlp(image_text)
            text = ' '.join([token.text for token in doc if not token.is_stop])
        except Exception as e:
            logger.error("Error: ", e)
            return jsonify({
                'status': 'error',
                'message': 'An error occurred while processing the image: ' + str(e)
            }), 500
        
        response = {
            'status': 'success',
            'text': text
        }

        logger.info(f'OCR Processed: {response}')
        return jsonify(response)