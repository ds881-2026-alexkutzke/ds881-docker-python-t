from flask import Flask, request, jsonify
import socket

app = Flask(__name__)

@app.route('/calcular', methods=['POST'])
def calcular():
    dados = request.get_json()
    op = dados.get('operador')
    v1 = dados.get('op1')
    v2 = dados.get('op2')

    try:
        if op == 'soma': res = v1 + v2
        elif op == 'subtracao': res = v1 - v2
        elif op == 'multiplicacao': res = v1 * v2
        elif op == 'divisao':
            if v2 == 0: raise ValueError("Divisao por zero")
            res = v1 / v2
        else: res = 0
        
        return jsonify({"container_host": socket.gethostname(), "resultado": res}), 200
    except Exception as e:
        return jsonify({"erro": str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
