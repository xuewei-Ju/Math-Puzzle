import logging
import json
from queue import Queue
from lambda_function import LambdaFunction
from dynamodb import DynamoDB
 
logging.basicConfig(format='%(asctime)s - %(threadName)s - %(module)s:%(funcName)s(%(lineno)d) - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
 
def lambda_handler(event, context):
    try:
        logger.info('consumer start.')
 
        dynamodb = DynamoDB()
        lambda_fnc = LambdaFunction()
 
        queue = Queue()
        queues = queue.dequeue()
        for queue in queues:
            if dynamodb.is_exists(queue['MessageId']) == False:
                json = queue['Body']
                lambda_fnc.invoke_worker(json)
                print 'worker invoke. json = ' + json
                dynamodb.save(queue['MessageId'])
 
        logger.info('consumer end.')
        return 'consumer success.'
    except Exception as e:
        logger.error('error raise.')
        logger.error(e)
        return 'consumer error.'
 
if __name__ == "__main__":
    lambda_handler({}, {})