FROM public.ecr.aws/lambda/nodejs:20

# Copy function code
COPY test.js ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "test.handler" ]
# todo move cmd to terraform
