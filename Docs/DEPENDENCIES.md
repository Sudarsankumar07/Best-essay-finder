# Project Dependencies Documentation

## 📦 Complete Dependency List

### 1. **Django (>=5.0.3, <6.0)**
   - **Purpose**: Primary web framework
   - **Used in**: All core functionality
   - **Installation**: `pip install Django>=5.0.3,<6.0`

### 2. **python-dotenv (>=1.0.0)**
   - **Purpose**: Load environment variables from `.env` file
   - **Used in**: `update/settings.py`
   - **Installation**: `pip install python-dotenv>=1.0.0`
   - **Why**: Keeps sensitive information like SECRET_KEY secure

### 3. **NLTK (>=3.8.1)**
   - **Purpose**: Natural Language Toolkit for text processing
   - **Used in**: `version/views.py`
   - **Installation**: `pip install nltk>=3.8.1`
   - **Functions used**:
     - `word_tokenize()` - Split text into words
     - `sent_tokenize()` - Split text into sentences
   - **Required downloads**: 
     ```bash
     python -m nltk.downloader punkt stopwords wordnet
     ```

### 4. **spaCy (>=3.7.0)**
   - **Purpose**: Advanced NLP library for AI detection
   - **Used in**: `version/views.py`
   - **Installation**: `pip install spacy>=3.7.0`
   - **Functions used**:
     - Token analysis
     - Lemmatization
     - Stop word filtering
   - **Required model**:
     ```bash
     python -m spacy download en_core_web_sm
     ```
   - **Why**: Provides sophisticated text analysis for detecting AI-generated content

### 5. **Pyphen (>=0.14.0)**
   - **Purpose**: Syllable counting for readability calculations
   - **Used in**: `version/views.py`
   - **Installation**: `pip install pyphen>=0.14.0`
   - **Functions used**:
     - `syllable_count()` - Count syllables in words for Flesch Reading Ease score

## 🔍 How Each Dependency is Used

### In `update/settings.py`:
```python
from dotenv import load_dotenv  # python-dotenv
import os
```
- Loads environment variables for SECRET_KEY, DEBUG, and ALLOWED_HOSTS

### In `version/views.py`:
```python
import nltk  # Natural Language Toolkit
import spacy  # Advanced NLP
from nltk.tokenize import word_tokenize, sent_tokenize
import pyphen  # Syllable counting
```

**Three main functions:**

1. **`calculate_readability(essay)`**
   - Uses: NLTK (tokenization), Pyphen (syllable counting)
   - Calculates Flesch Reading Ease score

2. **`is_ai_written(text)`**
   - Uses: spaCy
   - Analyzes text patterns to detect AI-generated content

3. **`syllable_count(word)`**
   - Uses: Pyphen
   - Counts syllables for readability formulas

## 📊 Dependency Tree

```
Best-essay-finder
├── Django (Web Framework)
│   ├── Built-in modules (admin, auth, sessions, etc.)
│   └── SQLite database support
├── python-dotenv (Configuration)
│   └── Environment variable management
└── NLP Stack (Essay Analysis)
    ├── NLTK (Text processing)
    │   ├── punkt (Tokenization)
    │   ├── stopwords (Common words)
    │   └── wordnet (Lexical database)
    ├── spaCy (AI detection)
    │   └── en_core_web_sm (English model)
    └── Pyphen (Syllable analysis)
```

## 🎯 Feature to Dependency Mapping

| Feature | Dependencies Used |
|---------|-------------------|
| Web Server & Routing | Django |
| Template Rendering | Django |
| Environment Config | python-dotenv |
| Text Tokenization | NLTK |
| Readability Scoring | NLTK + Pyphen |
| AI Detection | spaCy |
| Syllable Counting | Pyphen |

## 📝 Installation Order

**Recommended installation sequence:**

1. Install Django first (base framework)
2. Install python-dotenv (for configuration)
3. Install NLP libraries (NLTK, spaCy, Pyphen)
4. Download NLTK data files
5. Download spaCy language model

**Quick Install:**
```bash
# All at once
pip install -r requirements.txt

# NLTK data
python -m nltk.downloader punkt stopwords wordnet

# spaCy model
python -m spacy download en_core_web_sm
```

## 🔧 Troubleshooting

### Common Issues:

1. **spaCy model not found**
   ```bash
   python -m spacy download en_core_web_sm
   ```

2. **NLTK data not found**
   ```bash
   python -m nltk.downloader punkt stopwords wordnet
   ```

3. **Import errors**
   - Ensure virtual environment is activated
   - Run `pip install -r requirements.txt`

## 🚀 Production Considerations

For production deployment, consider:
- Pinning exact versions (use `pip freeze > requirements-lock.txt`)
- Using a production-grade database (PostgreSQL)
- Adding `gunicorn` or `uwsgi` for WSGI server
- Using `whitenoise` for static files
- Adding security packages like `django-cors-headers`

## 📌 Version Compatibility

- **Python**: 3.8 or higher recommended
- **Django**: 5.0.3+ (tested)
- **NLTK**: 3.8.1+ (latest stable)
- **spaCy**: 3.7.0+ (latest stable)
- **Pyphen**: 0.14.0+ (latest stable)

## 📚 Additional Resources

- [Django Documentation](https://docs.djangoproject.com/)
- [NLTK Documentation](https://www.nltk.org/)
- [spaCy Documentation](https://spacy.io/)
- [Pyphen Documentation](https://pyphen.org/)
- [python-dotenv Documentation](https://pypi.org/project/python-dotenv/)
