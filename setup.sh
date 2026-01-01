#!/bin/bash

echo "========================================"
echo "Best Essay Finder - Setup Script"
echo "========================================"
echo ""

echo "[1/6] Creating virtual environment..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "Error: Failed to create virtual environment"
    exit 1
fi
echo "Virtual environment created successfully!"
echo ""

echo "[2/6] Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error: Failed to activate virtual environment"
    exit 1
fi
echo "Virtual environment activated!"
echo ""

echo "[3/6] Installing Python dependencies..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Error: Failed to install dependencies"
    exit 1
fi
echo "Dependencies installed successfully!"
echo ""

echo "[4/6] Downloading NLTK data..."
python -m nltk.downloader punkt stopwords wordnet
if [ $? -ne 0 ]; then
    echo "Warning: NLTK data download had issues"
fi
echo "NLTK data downloaded!"
echo ""

echo "[5/6] Downloading spaCy English model..."
python -m spacy download en_core_web_sm
if [ $? -ne 0 ]; then
    echo "Error: Failed to download spaCy model"
    exit 1
fi
echo "spaCy model downloaded successfully!"
echo ""

echo "[6/6] Running database migrations..."
python manage.py migrate
if [ $? -ne 0 ]; then
    echo "Error: Failed to run migrations"
    exit 1
fi
echo "Database migrations completed!"
echo ""

echo "========================================"
echo "Setup completed successfully!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Copy .env.example to .env and configure your settings"
echo "2. Run: python manage.py runserver"
echo "3. Open http://127.0.0.1:8000/ in your browser"
echo ""
