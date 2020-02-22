import json
import falcon


class HolaResource(object):

    def on_get(self, req, resp):
        doc = {
            'images': [
                {
                    'href': '/valeriaychris.jpeg'
                }
            ],
            'hello world!':'hola mundo!',
        }

        # Create a JSON representation of the resource
        resp.body = json.dumps(doc, ensure_ascii=False)

        # The following line can be omitted because 200 is the default
        # status returned by the framework, but it is included here to
        # illustrate how this may be overridden as needed.
        resp.status = falcon.HTTP_200
