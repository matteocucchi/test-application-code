# syntax=docker/dockerfile:1
FROM python
WORKDIR /app
RUN pip3 install Flask

COPY . .

# CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
