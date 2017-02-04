import logging
import json
from queue import Queue
 
logging.basicConfig(format='%(asctime)s - %(threadName)s - %(module)s:%(funcName)s(%(lineno)d) - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
 
def lambda_handler(event, context):
    try:
        logger.info('main start.')
 
        data = json.loads(json.dumps(event))
        queue = Queue()
 
        for attr in data.get('names'):
            queue.enqueue(attr.get('name'))
 
        logger.info('main end.')
        return 'main success.'
    except Exception as e:
        logger.error('error raise.')
        logger.error(e)
        return 'main error.'
 
if __name__ == "__main__":
    lambda_handler({"names":[{"name":"NameA"},{"name":"NameB"},{"name":"NameC"}]}, {})
