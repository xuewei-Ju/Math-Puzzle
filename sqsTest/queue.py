import boto3
 
class Queue:
    QUEUE_NAME = 'sqs_workloads_queue'
    MAX_QUEUE_COUNT = 10
    REGION = 'ap-northeast-1'
 
    def enqueue(self, name):
        client = self.__client()
 
        response = client.send_message(
            QueueUrl=self.__queue_url(),
            MessageBody='{"name": "%s"}' % name
        )
 
        return response['ResponseMetadata']['HTTPStatusCode'] == 200
 
    def dequeue(self):
        client = self.__client()
 
        response = client.receive_message(
            QueueUrl=self.__queue_url(),
            MaxNumberOfMessages=self.MAX_QUEUE_COUNT
        )
 
        messages = []
        if 'Messages' in response:
            for message in response['Messages']:
                messages.append(message)
                client.delete_message(
                    QueueUrl=self.__queue_url(),
                    ReceiptHandle=message['ReceiptHandle']
                )
 
        return messages
 
    def __client(self):
        return boto3.client('sqs', region_name=self.REGION)
 
    def __queue_url(self):
        return self.__client().get_queue_url(QueueName=self.QUEUE_NAME)['QueueUrl']