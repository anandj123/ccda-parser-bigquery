# Generate custom batch launch configurations
envsubst < launch-ccda-batch-v1.sh > launch-ccda-batch-custom.sh
chmod +x aunch-ccda-batch-custom.sh
# Build docker image and push it to google artifact registry
gcloud builds submit --region=global --tag $IMAGE_LOCATION