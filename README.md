# Best Essay Finder

A Django web application that evaluates multiple essays using Natural Language Processing (NLP) to determine the best essay based on readability scores and AI-detection algorithms.

## ✨ Features

- **Multi-Essay Comparison**: Submit multiple essays for simultaneous evaluation
- **Readability Analysis**: Calculate Flesch Reading Ease scores
- **AI Detection**: Identify potentially AI-generated content
- **Dynamic Form**: Add unlimited essay inputs dynamically
- **Best Essay Selection**: Automatically identifies the highest-quality essay

## 📋 Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sudarsankumar07/Best-essay-finder.git
   cd Best-essay-finder
   ```

2. **Create a virtual environment**
   ```bash
   python -m venv venv
   ```

3. **Activate the virtual environment**
   - On Windows:
     ```bash
     venv\Scripts\activate
     ```
   - On macOS/Linux:
     ```bash
     source venv/bin/activate
     ```

4. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

5. **Download NLTK data files**
   ```bash
   python -m nltk.downloader punkt stopwords wordnet
   ```

6. **Download spaCy English language model**
   ```bash
   python -m spacy download en_core_web_sm
   ```

7. **Set up environment variables**
   - Copy `.env.example` to `.env`
   - Update the values in `.env` with your configuration

8. **Run migrations**
   ```bash
   python manage.py migrate
   ```

9. **Create a superuser (optional)**
   ```bash
   python manage.py createsuperuser
   ```

10. **Run the development server**
   ```bash
   python manage.py runserver
   ```

11. **Access the application**
   - Open your browser and navigate to `http://127.0.0.1:8000/`
   - Admin panel: `http://127.0.0.1:8000/admin/`

## 📁 Project Structure

```
Best-essay-finder/
├── update/              # Django project settings
│   ├── settings.py      # Project settings
│   ├── urls.py          # Main URL configuration
│   ├── wsgi.py          # WSGI configuration
│   └── asgi.py          # ASGI configuration
├── version/             # Django app
│   ├── templates/       # HTML templates
│   ├── views.py         # View functions
│   ├── urls.py          # App URL configuration
│   ├── models.py        # Database models
│   └── admin.py         # Admin configuration
├── manage.py            # Django management script
├── requirements.txt     # Python dependencies
└── .env.example         # Environment variables template
```

## 🔧 Configuration

Make sure to configure the following in your `.env` file:
- `SECRET_KEY`: Django secret key
- `DEBUG`: Set to `False` in production
- `ALLOWED_HOSTS`: Add your domain names

## 🤝 Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Create a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 👤 Author

**Sudarsan Kumar**
- GitHub: [@Sudarsankumar07](https://github.com/Sudarsankumar07)

## 🐛 Issues

If you encounter any issues, please report them on the [GitHub Issues](https://github.com/Sudarsankumar07/Best-essay-finder/issues) page.
