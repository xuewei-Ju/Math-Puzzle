import boto3
import base64
 
class LambdaFunction:
    REGION = 'ap-northeast-1'
    WORKER_FUNCTION = 'sqs_workers_worker'
 
    def invoke_worker(self, json):
        client = boto3.client('lambda', region_name=self.REGION)
 
        response = client.invoke(
            FunctionName=self.WORKER_FUNCTION,
            InvocationType='Event',
            LogType='Tail',
            Payload=json
        )
 
        return True