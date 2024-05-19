FROM public.ecr.aws/lambda/nodejs:20

# Copy function code
COPY . ${LAMBDA_TASK_ROOT}
