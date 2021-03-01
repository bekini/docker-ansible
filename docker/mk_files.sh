

# make ansible test host setup for ansible in docker

# information found in file "test_hosts
# --- files to make ---
# - .ssh/config
# - .ssh/known_hosts

ansible_inventory="../testX"

> ssh/config
> ssh/known_hosts
> $ansible_inventory

mk_ansible_inventory()
{
ip=$1
host=$2
user=$3
echo "[$host]"  >> $ansible_inventory
echo "$ip ansible_connection=ssh ansible_ssh_user=$user"  >> $ansible_inventory

}

function mk_config()
{
ip=$1
host=$2
user=$3
echo "Host $host" >> ssh/config
echo "  HostName $ip" >> ssh/config
echo "  User $user" >> ssh/config
echo "  Port 22" >> ssh/config
}

function allow_host()
{
ip=$1
ssh-keyscan $ip >> ssh/known_hosts

}

IFS=":"
export IFS

while read ip host user
do
mk_ansible_inventory  $ip $host $user
mk_config $ip $host $user
allow_host $ip

echo $ip $host $user
done < test_hosts
