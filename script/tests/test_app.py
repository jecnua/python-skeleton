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
    Testing all the entrypoints
    '''

#    def setUp(self):
    # app.app.testing = True

    def test_run(self):
        result = app.run()
        self.assertEqual(result, "")