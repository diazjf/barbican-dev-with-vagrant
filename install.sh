# Install Packages for Development
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y apache2
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y git-review
sudo apt-get install -y python-pip
sudo apt-get install -y python2.7-dev
sudo apt-get install -y python3.4
sudo apt-get install -y python3.4-dev
sudo apt-get install -y python-tox
sudo apt-get install -y libssl-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y ebtables
sudo apt-get install -y python-tox
sudo pip install rpdb

# Setup Git and Gerrit
git config --global user.name "Fernando Diaz"
git config --global user.email "diazjf@us.ibm.com"
git config --global --add gitreview.username "diazjf"
ssh-keygen -t rsa

# setup vim packages
git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle
cat <<EOF > .vimrc
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
map <F2> :NERDTreeToggle<CR>
Bundle 'klen/python-mode'
let g:pymode_rope = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END
filetype plugin indent on
EOF
sudo vim +PluginInstall +qall
sudo chown -R vagrant:vagrant /home/vagrant/.vim

# Setup devstack
git clone https://github.com/openstack-dev/devstack /home/vagrant/devstack
cd /home/vagrant/devstack
cat <<EOF > local.conf
[[local|localrc]]
disable_all_services
enable_plugin barbican https://git.openstack.org/openstack/barbican
enable_service rabbit mysql key
#RECLONE=yes
KEYSTONE_TOKEN_FORMAT=UUID
DATABASE_PASSWORD=secretdatabase
RABBIT_PASSWORD=secretrabbit
ADMIN_PASSWORD=secretadmin
SERVICE_PASSWORD=secretservice
SERVICE_TOKEN=111222333444
LOGFILE=/opt/stack/logs/stack.sh.log
EOF
sudo chown -R vagrant:vagrant /opt/stack/

cd devstack
./stack.sh
