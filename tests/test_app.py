import os
import sys
import unittest


sys.path.insert(0, os.path.split(os.path.abspath(__file__))[0] + "/../src/")

import app

class MyTestCase(unittest.TestCase):

    def setUp(self):
        app.app.testing = True
        self.app = app.app.test_client()

    def test_get(self):
        result = self.app.get('/')
        self.assertEqual(result.status_code, 200)
        self.assertEqual(result.data, b'Hello, World! GET')

    def test_post(self):
        result = self.app.put('/')
        self.assertEqual(result.status_code, 200)
        self.assertEqual(result.data, b'Hello, World! PUT')

    def test_fail_on_post(self):
        result = self.app.post('/')
        self.assertEqual(result.status_code, 405)
