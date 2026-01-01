@echo off
echo ========================================
echo Best Essay Finder - Setup Script
echo ========================================
echo.

echo [1/6] Creating virtual environment...
python -m venv venv
if errorlevel 1 (
    echo Error: Failed to create virtual environment
    pause
    exit /b 1
)
echo Virtual environment created successfully!
echo.

echo [2/6] Activating virtual environment...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo Error: Failed to activate virtual environment
    pause
    exit /b 1
)
echo Virtual environment activated!
echo.

echo [3/6] Installing Python dependencies...
pip install -r requirements.txt
if errorlevel 1 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)
echo Dependencies installed successfully!
echo.

echo [4/6] Downloading NLTK data...
python -m nltk.downloader punkt stopwords wordnet
if errorlevel 1 (
    echo Warning: NLTK data download had issues
)
echo NLTK data downloaded!
echo.

echo [5/6] Downloading spaCy English model...
python -m spacy download en_core_web_sm
if errorlevel 1 (
    echo Error: Failed to download spaCy model
    pause
    exit /b 1
)
echo spaCy model downloaded successfully!
echo.

echo [6/6] Running database migrations...
python manage.py migrate
if errorlevel 1 (
    echo Error: Failed to run migrations
    pause
    exit /b 1
)
echo Database migrations completed!
echo.

echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo Next steps:
echo 1. Copy .env.example to .env and configure your settings
echo 2. Run: python manage.py runserver
echo 3. Open http://127.0.0.1:8000/ in your browser
echo.
pause
