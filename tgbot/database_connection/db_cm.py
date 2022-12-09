import psycopg2


class DataBaseConnect():
    def __init__(self):
        self.connection = psycopg2.connect(host="127.0.0.1", port="5432", dbname="new_year", user="postgres",
                                      password="qwerty")
        self.cursor = self.connection.cursor()

    def get_query(self, query, args):
        pass


