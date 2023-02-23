from flask import jsonify


def response_ok(data, *args, **kwargs):
    return jsonify({
        'status': 'ok',
        'message': None,
        'data': data
    })


def response_error(message, *args, **kwargs):
    return jsonify({
        'status': 'error',
        'message': message,
        'data': None
    })


def response_not_supported(action=None, *args, **kwargs):
    msg = 'Action {:s} not supported!'.format(action) if action else 'Not supported!'
    return response_error(msg)


def response_not_found(action=None, *args, **kwargs):
    msg = 'Action {:s} not found!'.format(action) if action else 'Not found!'
    return response_error(msg)
