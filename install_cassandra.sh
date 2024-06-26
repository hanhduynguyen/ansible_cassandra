#ansible-playbook -i inventory.yml main.yaml --limit 'node1,node2,node3' 
echo 'Startint in node1'
ansible-playbook -i inventory.yml main.yaml --limit 'node1' --start-at-task='Start start cassandra after configure cluster'
sleep 30
echo 'Startint in node2'
ansible-playbook -i inventory.yml main.yaml --limit 'node2' --start-at-task='Start start cassandra after configure cluster'
sleep 30
echo 'Startint in node3'
ansible-playbook -i inventory.yml main.yaml --limit 'node3' --start-at-task='Start start cassandra after configure cluster'