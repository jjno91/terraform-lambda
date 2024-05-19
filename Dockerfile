FROM public.ecr.aws/lambda/nodejs:20

# https://github.com/aws/aws-lambda-base-images/blob/nodejs20.x/x86_64/Dockerfile.nodejs20.x#L14
COPY . /var/task
