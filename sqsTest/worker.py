import logging
import json
from queue import Queue
 
logging.basicConfig(format='%(asctime)s - %(threadName)s - %(module)s:%(funcName)s(%(lineno)d) - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
 
def lambda_handler(event, context):
    try:
        logger.info('worker start.')
 
        data = json.loads(json.dumps(event))
        print('worker received name = ' + data['name'])
         
        logger.info('worker end.')
        return 'worker success.'
    except Exception as e:
        logger.error('error raise.')
        logger.error(e)
        return 'worker error.'
 
if __name__ == "__main__":
    lambda_handler({"name":"host1"}, {})