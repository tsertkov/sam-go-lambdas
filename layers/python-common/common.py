import requests

def say_hello():
  return "Hello from shared layer!"

def call_echo():
  r = requests.get('https://postman-echo.com/get?key=value')
  return r.json()["args"]
