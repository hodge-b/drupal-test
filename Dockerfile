FROM landoop/drupal:latest

# Copy any custom configuration files
COPY config/some-config-file.conf /etc/apache2/sites-available/

# Copy any custom scripts
COPY scripts/some-script.sh /usr/local/bin/

# Install any additional packages or dependencies
RUN apt-get update && \
    apt-get install -y some-package

# Set environment variables
ENV ENV_VAR_NAME=env_var_value

# Expose any necessary ports
EXPOSE 80

# Set the default command to start Apache and PHP-FPM
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
