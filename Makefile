
all: ruby-bundler puppet ruby-augeas ruby-shadow

ruby-shadow: |ruby19
	cd ~/rpmbuild ; rpmbuild -bb SPECS/ruby-shadow.spec

ruby-augeas: |ruby19
	cd ~/rpmbuild ; rpmbuild -bb SPECS/ruby-augeas.spec

puppet: |ruby19 facter
	cd ~/rpmbuild ; rpmbuild -bb SPECS/puppet.spec

ruby-bundler: |ruby19
	cd ~/rpmbuild ; rpmbuild -bb SPECS/ruby-bundler.spec

facter: ~/rpmbuild/RPMS/noarch/facter-1.6.4-0.1.el5.noarch.rpm
	rpm -Uvh $^ || true

~/rpmbuild/RPMS/noarch/facter-1.6.4-0.1.el5.noarch.rpm: |ruby19
	cd ~/rpmbuild ; rpmbuild -bb SPECS/facter.spec

ruby19: ~/rpmbuild/RPMS/x86_64/ruby-1.9.2p320-1.el6.x86_64.rpm
	rpm -Uvh $^ || true

~/rpmbuild/RPMS/x86_64/ruby-1.9.2p320-1.el6.x86_64.rpm: ~/rpmbuild/SOURCES/ruby-1.9.2-p320.tar.gz
	cd ~/rpmbuild ; rpmbuild -bb SPECS/ruby19.spec

~/rpmbuild/SOURCES/ruby-1.9.2-p320.tar.gz: |~/rpmbuild
	cd ~/rpmbuild/SOURCES ; wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz

~/rpmbuild:
	rpmdev-setuptree
	cp SOURCES/* ~/rpmbuild/SOURCES
	cp SPECS/* ~/rpmbuild/SPECS

clean:
	rm -rf ~/rpmbuild
	yum -y remove ruby

