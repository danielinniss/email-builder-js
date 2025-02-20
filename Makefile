deploy:
	@docker build . -t danielinniss/email-builder:latest --platform=linux/amd64,linux/arm64
	@docker push danielinniss/email-builder:latest
