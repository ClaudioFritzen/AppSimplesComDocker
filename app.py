from flask import Flask
import random

app = Flask(__name__)

frases = [
    "Você é mais forte do que imagina!",
    "Acredite no seu potencial!",
    "Todo dia é uma nova chance!",
    "Persista, mesmo que pareça difícil.",
    "Você consegue!"
]

@app.route('/')
def frase_motivacional():
    return random.choice(frases)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
