FROM public.ecr.aws/lambda/nodejs:20

# Copy function code
COPY main.js ${LAMBDA_TASK_ROOT}
