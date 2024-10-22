FROM python:3.11-slim
LABEL author=${LABEL}
COPY . ./churn_app
WORKDIR churn_app 
RUN pip3 install -r requirements.txt
EXPOSE ${APP_PORT}
VOLUME /models
#CMD ["uvicorn", "app.churn_app:app", "--host", "0.0.0.0", "--port", "${APP_PORT}"]
CMD ["sh", "-c", "uvicorn app.churn_app:app --host 0.0.0.0 --port ${APP_PORT}"]

