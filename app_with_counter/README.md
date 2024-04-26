### 2 Микросервиса:

1) Микросервис для общения с коровой: 
Корова выбирает приветствия из файла ./speeches/greetings.txt 
и записывает, и каждый раз как к нему обратились отправляет запрос на второй микросервис

2) Микросервис-счетчик:
Считает, сколько раз к нему обратились.
Возвращает число обращений по запросу




Для запуска:

```bash
python3 -m venv ./venv
source venv/bin/activate
pip3 install -r requirements_counter.txt
pip3 install -r requirements_main.txt
uvicorn main_app.main:app --host 0.0.0.0 --port 4648
```

в новом терминале перейдите в директорию, где лежат README.MD
```bash
source venv/bin/activate
uvicorn counter_app.main:app --host 0.0.0.0 --port 4649
```

### Для клиента:

```bash
#общение с коровой
curl http://127.0.0.1:4648/cowsay?input_=Muuu!
#сколько раз обратились к корове?
curl http://127.0.0.1:4649/get_counts
```


### Запуск в Docker
-  build

```bash
docker image build . --file Dockerfile_counter --tag app_with_counter:counter
docker image build . --file Dockerfile_main --tag app_with_counter:main
```

- run

```bash
docker container run --publish 4648:4648  --name main_app -d --network host app_with_counter:main
docker container run --publish 4649:4649  --name counter -d  app_with_counter:counter
```


