# keepalived_check_script

Small bash script that checks if services are running on a host

## Usage
$ keepcheck.sh [ list of service's you really care about ]

Place the script somewhere ( /usr/local/bin/ ) and configure keepalived to use it. Dont forget to make it executable ;) 
The script will prints 0 for "Ok" and 1 when a service or services are broken". 


## Example
<script.sh> service1 service2 service3 etc

keepcheck.sh sshd nginx mariadb your_custom_script

Config example for keepalived

vrrp_script chk_myscript {
  script       "/usr/local/bin/check-keepalived.sh sshd nginx "
  interval 2   # check every 2 seconds
  fall 2       # require 2 failures for KO
  rise 2       # require 2 successes for OK
}
