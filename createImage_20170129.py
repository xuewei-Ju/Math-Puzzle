
for reservation in ec2.describe_instances(Filters=[{'Name': 'tag-key', 'Values': ['EUD']}):
    for instance in reservation["Instance"]:

	# get tag name and instance id
	ami_name = instance.tags['Name']
	instance_id = instance.id

	# create image 
	try:
	    ami_id = instance.create_image(ami_name, description='Create')
	except Exception, e:
	    logger.error("Backup ")
	    continue

	images = ec2.get_all_images(image_ids = ami_id)
	image = images[0]
	image.add_tag("Name", ami_name)
