from robot.libraries.BuiltIn import BuiltIn
from JsonValidator import JsonValidator


class Categories:
    builtin_lib: BuiltIn = BuiltIn()
    js = JsonValidator()

    def get_postgresql_lib(self):
        return self.builtin_lib.get_library_instance('DB')


    def get_category_by_name_and_category(self):
        sql = """SELECT category, categoryname
              from bootcamp.categories"""
        return self.get_postgresql_lib().execute_sql_string_mapped(sql)


    def get_categories_and_names(self, data: list):
            cat_ids = []
            names = []
            for i in data:
                cat_ids.append(i['category'])
                names.append(i['categoryname'])
            return cat_ids, names


    def get_requests_lib(self):
        return self.builtin_lib.get_library_instance("Req")


    def get_data_categories_from_rest(self, alias, params, expected_status):
        result = self.get_requests_lib().get_on_session(alias=alias, url='/categories?',
                                                        params=params,
                                                        expected_status=expected_status)
        category = self.js.get_elements(result.json(), '$..category')
        name = self.js.get_elements(result.json(), '$..categoryname')
        return category, name


    def get_data_from_rest(self, alias, url, params, expected_status='200'):
        result = self.get_requests_lib().get_on_session(alias=alias, url=url,
                                                        params=params, expected_status=expected_status)
        return result.json()



