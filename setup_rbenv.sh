
#!/bin/bash

set -ex
brew update
brew install rbenv ruby-build
rbenv install 2.5.3
echo "export GEM_HOME=$HOME/gems" >> ~/.zshrc
echo "export PATH=$HOME/gems/bin:$PATH" >> ~/.zshrc
source ~/.zshrc
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv global 2.5.3
gem install jekyll bundler
rbenv rehash
ruby -v
jekyll -v

if ! type rbenv | grep function; then
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
fi

set +x
echo "Done! Close and reopen your terminal"
