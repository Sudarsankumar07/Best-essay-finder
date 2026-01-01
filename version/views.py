from django.http import HttpResponse
from django.shortcuts import render
import nltk
import spacy
from nltk.tokenize import word_tokenize, sent_tokenize
import pyphen

# Download NLTK resources
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

# Load spaCy model
nlp = spacy.load("en_core_web_sm")

# Initialize Pyphen
dic = pyphen.Pyphen(lang='en')

def home(request):
    return render(request, 'basic.html')

def start(request):
    if request.method == 'POST':
        essays = [request.POST[key] for key in request.POST if key.startswith('essay')]
        if not essays:
            return HttpResponse('No essays provided', status=400)

        readability_scores = []
        ai_predictions = []

        for essay in essays:
            readability_scores.append(calculate_readability(essay))
            ai_predictions.append(is_ai_written(essay))

        best_essay_index = readability_scores.index(max(readability_scores))
        best_essay = essays[best_essay_index]
        ai_status = "likely written by AI" if ai_predictions[best_essay_index] else "not likely written by AI"

        return render(request, 'basic.html', {
            'content': best_essay,
            'ai_status': ai_status,
            'score': readability_scores[best_essay_index]
        })
    else:
        return HttpResponse('Method not allowed', status=405)

def is_ai_written(text):
    doc = nlp(text)
    if len(doc) < 100:
        return False
    unique_tokens = set([token.text.lower() for token in doc if not token.is_stop and not token.is_punct])
    unique_lemmas = set([token.lemma_ for token in doc if not token.is_stop and not token.is_punct])
    repetition_ratio = len(unique_tokens) / len(doc)
    lemma_ratio = len(unique_lemmas) / len(unique_tokens)
    return repetition_ratio < 0.2 or lemma_ratio < 0.5

def syllable_count(word):
    return len(dic.inserted(word).split('-'))

def calculate_readability(essay):
    num_words = len(word_tokenize(essay))
    num_sentences = len(sent_tokenize(essay))
    num_syllables = sum(syllable_count(word) for word in word_tokenize(essay))
    if num_sentences == 0 or num_words == 0:
        return 0
    score = 206.835 - 1.015 * (num_words / num_sentences) - 84.6 * (num_syllables / num_words)
    return round(score, 2)
