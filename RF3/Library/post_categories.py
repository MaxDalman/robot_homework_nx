from robot.libraries.BuiltIn import BuiltIn


class Categories:
    builtin_lib: BuiltIn = BuiltIn()

    def get_requests_lib(self):
        return self.builtin_lib.get_library_instance("Req")

    def post_data_categories(self, alias, json, headers, expected_status):
        result = self.get_requests_lib().post_on_session(alias=alias, url='/categories?',
                                                        json=json,
                                                        headers=headers,
                                                        expected_status=expected_status)