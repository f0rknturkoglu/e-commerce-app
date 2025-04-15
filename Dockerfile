# Python resmi imajını kullan
FROM python:3.11-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Gereksinim dosyalarını kopyala
COPY requirements.txt .

# Gereksinimleri kur
RUN pip install --no-cache-dir -r requirements.txt

# Tüm proje dosyalarını kopyala
COPY . .

# Uygulamayı çalıştır
CMD ["python", "app.py"]
