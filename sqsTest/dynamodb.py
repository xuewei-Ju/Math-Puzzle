import boto3
 
class DynamoDB:
    REGION = 'ap-northeast-1'
 
    def save(self, id):
        client = self.__client()
 
        response = client.update_item(
            TableName='sqs_workloads_ids',
            Key={
                'id': {
                    'S': id
                }
            }
        )
 
        return True
 
    def is_exists(self, id):
        client = self.__client()
 
        response = client.get_item(
            TableName='sqs_workloads_ids',
            Key={
                'id': {
                    'S': id
                }
            },
            ConsistentRead=True
        )
 
        return 'Item' in response
 
    def __client(self):
        return boto3.client('dynamodb', region_name=self.REGION)