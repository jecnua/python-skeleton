'''
Entrypoint module
'''
import logging
import os

TEST_MODE = os.getenv('TEST_MODE', 'false')
LOG_LEVEL = os.getenv('LOG_LEVEL', 'INFO')

def run():
    '''
    Main function
    '''
    logging.debug('Main function')
    return ""

if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s - %(levelname)s - %(message)s', level=logging.getLevelName(LOG_LEVEL), datefmt='%Y-%m-%d %H:%M:%S')
    run()
