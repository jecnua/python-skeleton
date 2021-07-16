'''
Tests for endpoint
'''
import os
import sys
import unittest

sys.path.insert(0, os.path.split(os.path.abspath(__file__))[0] + "/../src/")

import app

class MyTestCase(unittest.TestCase):
    '''
    Testing all the entrypoints and method combination
    '''

    def setUp(self):
        app.app.testing = True
        self.app = app.app.test_client()

    def test_get(self):
        '''
        Test main entrypoint with GET
        '''
        result = self.app.get('/')
        self.assertEqual(result.status_code, 200)
        self.assertEqual(result.data, b'Hello, World! GET')

    def test_post(self):
        '''
        Test main entrypoint with PUT
        '''
        result = self.app.put('/')
        self.assertEqual(result.status_code, 200)
        self.assertEqual(result.data, b'Hello, World! PUT')

    def test_fail_on_post(self):
        '''
        Test calling with a method not allowed
        '''
        result = self.app.post('/')
        self.assertEqual(result.status_code, 405)

    def test_internal_error(self):
        '''
        Test I can raise correctly an internal error
        '''
        result = self.app.get('/cause-error/')
        self.assertEqual(result.status_code, 500)
