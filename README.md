# keepalived_check_script

Small bash script that checks if services are running on the host.


# Usage
keepcheck.sh [service's! you want to have checked]

# Example
keepcheck.sh sshd nginx mariadb your_custom_script

Place the script somewhere ( /usr/local/bin/ ) and configure keepalived to use it.

The script will prints 0 for "Ok" and 1 for "service is broken"
