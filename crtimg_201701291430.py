from __future__ import print_function
import boto3
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

  # This function will createAMI and create CreateTage
  
def lambda_handler(event, context):

  logger.info("Event AMI Create: " + json.dumps(event))

  client_ec2 = boto3.client('ec2')
  res_ec2 = boto3.resource('ec2')

  # except condition; these condition is assumed, to be modified
  filters_param = {
    'Filters': [
        {
            'Name': 'tag-key',
            'Values': ['EUD']
        },
        {
            'Name': 'tag-value',
            'Values': ['YES']
        }
    ]
   }
  
  # 
  response = client_ec2.describe_instances(**filters_param)
  
  # check the return code
  HTTP_code = response['ResponseMetadata']['HTTPStatusCode']
  if str(HTTP_code) != '200':
     logger.info("http error")

  # loop1: one is instance id
  for Instance_id in Instances_id:
    
    # 
    res = response['Reservations'].pop()
    Instance_info = res['Instances'].pop()
  
  

  # Get instance id information
  Instances_id = Instance_info['InstanceId']
  


    
    # prepare for the parameter
    image_param = {
        'InstanceId': str(Instance_id) ,
        'Name': 'kkk'
    }
    
    # create AMI
    ec2_resour = boto3.resource('ec2')
    ec2_instance = ec2_resour.Instance(Instance_id)
    response_2 = ec2_instance.create_image(**image_param)
    
    # get image ID     
    image_ids = response_2['ImageId']
    logger.info("EC2 AMI created " + str(image_ids))

    # Get tag information
    client_ec2_l = boto3.client(ec2)
    tags_info = client_ec2_1.describe_tags(
        Filters=[
            {
                'Name': 'resource-id',
                'Values': [Instance_id]
            },
            {
                'Name': 'resource-type',
                'Values': 'instance'
            },
        ],
    )
    
    Tags_info = Instance_info['Tags'].pop()
  
    # prepare image object for tag attachment
    ec2_image = res_ec2.Image(image_ids)
    
    # loop 2
    for tag_info in Tags_info:
        keyinfo = tag_info['key']
        valinfo = tag_info['value']
        
        # Exclude 'Name' tag key.
        if keyinfo == 'Name':
            continue
        
        # Exclude 'aws:' tag, which is attached by CloudFormation
        # if valinfo.count('aws:') != 0:
        #    continue
        
        # create Tag
        tag = ec2_image.create_tags(
            DryRun=True,
            Tags=[
                {
                    'Key': [keyinfo],
                    'Value': [valinfo]
                }
            ]
        )

        logger.info("tag created: " + str(tag))


