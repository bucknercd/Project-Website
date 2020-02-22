import falcon
import bjoern
from resources.HolaResource import HolaResource

wsgi_app = api = application = falcon.API()

# -- Edit Here --
api.req_options.auto_parse_form_urlencoded = True
api.add_route('/hola', HolaResource()) # attach resources to API
# -- End of Edit --

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("host", help="Provide host info as so <ip>:<port> or only <ip>. Default port is 80.", default='0.0.0.0:8000')
    args = parser.parse_args()

    if ':' in args.host:
        ip, port = args.host.split(':')
        port = int(port)
    else:
        ip = args.host
        port = 80
    bjoern.run(wsgi_app, ip, port)
