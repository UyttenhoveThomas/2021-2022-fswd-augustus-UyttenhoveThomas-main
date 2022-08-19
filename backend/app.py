from repositories.DataRepository import DataRepository
from flask import Flask, jsonify, request
from flask_cors import CORS


# Start app
app = Flask(__name__)
app.config['SECRET_KEY'] = 'Secret!'

CORS(app)

# Custom endpoint
endpoint = '/api/v1'


# ROUTES
# *************** Routes nodig voor het front-end examen  ***************

@app.route('/', methods=['GET'])
def get_root():
    if request.method == 'GET':
        return "welkom bij het examen Steps, ga naar het correcte endpoint", 200


@app.route(endpoint + '/dropoffzones/', methods=['GET', 'POST'])
def get_dropoffzones():
    if request.method == 'GET':
        return jsonify(zones=DataRepository.read_zones()), 200
    elif request.method == 'POST':
        gegevens = DataRepository.json_or_formdata(request)
        print(gegevens)
        nieuw_id = DataRepository.create_dropoff(
            gegevens['omschrijving'], gegevens['straat'], gegevens['huisnr'], gegevens['lat'], gegevens['long'])
        return jsonify(nieuw_id=nieuw_id), 201


@app.route(endpoint + '/dropoffzones/<zoneid>/steps/', methods=['GET'])
def get_dropoffzones_on_dag(zoneid):
    if request.method == 'GET':
        return jsonify(steps=DataRepository.read_steps_by_zone_id(zoneid)), 200


@app.route(endpoint + '/steps/<stepid>/', methods=['GET'])
def get_step(stepid):
    if request.method == 'GET':
        return jsonify(step=DataRepository.read_step_by_id(stepid)), 200


# ********************************* Hieronder maak je straks het examendeel2: backend  ****************************






# Start app
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
