#!/bin/bash

\curl -sSL https://github.com/ermaker/bootstrap/raw/master/chef.sh | bash

BERKSFILE=Berksfile
cat <<-EOS > $BERKSFILE
source "https://supermarket.chef.io"
cookbook "git"
EOS
COOKBOOKS_DIR=/var/chef/cookbooks
sudo berks vendor $COOKBOOKS_DIR
rm -f $BERKSFILE
sudo rm -f ${BERKSFILE}.lock
sudo rm -rf ~/.berkshelf
sudo chef-solo -j <(echo '{"run_list":["recipe[git]"]}')
sudo rm -rf $COOKBOOKS_DIR
