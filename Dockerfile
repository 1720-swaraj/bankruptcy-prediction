FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY streamlit_app.py rnd.pkl ./

EXPOSE 8501

CMD ["sh", "-c", "streamlit run streamlit_app.py --server.port=${PORT:-8501} --server.address=0.0.0.0 --server.headless=true --browser.gatherUsageStats=false"]