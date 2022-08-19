from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    #########  zones  #########
    @staticmethod
    def read_zones():
        sql = "SELECT * from tblDropOffZone"
        return Database.get_rows(sql)

    @staticmethod
    def read_steps_by_zone_id(id_zone):
        sql = "SELECT idHuurstep, serienummer, kleur FROM tblHuurstep WHERE idDropOffZone = %s"
        params = [id_zone]
        return Database.get_rows(sql, params)

    @staticmethod
    def read_step_by_id(id_step):
        sql = "SELECT * FROM tblHuurstep WHERE idHuurstep = %s"
        params = [id_step]
        return Database.get_one_row(sql, params)

    @staticmethod
    def create_dropoff(omschrijving, straat, huisnummer, lat, lng):
        sql = "INSERT INTO tblDropOffZone (omschrijving, straat, huisnr, latitude, longitude) VALUES (%s,%s,%s,%s,%s)"
        params = [omschrijving, straat, huisnummer, lat, lng]
        return Database.execute_sql(sql, params)

    # ********************************* Hieronder maak je straks het examendeel2: backend  ****************************