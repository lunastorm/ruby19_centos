%define oname   bundler

Name:       ruby-%{oname}
Version:    1.0.21
Release:    1.el5
Summary:    The best way to manage your application's dependencies
Group:      Development/Ruby
License:    MIT
URL:        http://gembundler.com
Source0:    http://rubygems.org/downloads/%{oname}-%{version}.gem
Requires:   ruby(abi) = 1.9
BuildArch:  noarch
BuildRoot:  %{_tmppath}/%{name}-%{version}-root

%description
Bundler manages an application's dependencies through its entire life,
across many machines, systematically and repeatably

%prep

%build

%install
rm -rf %{buildroot}
/bin/sh -c "GEM_HOME=%{buildroot}/usr/lib64/ruby/gems/1.9.1/ gem install bundler --version 1.0.21"

%files

/usr/lib64/ruby/gems/1.9.1/bin/bundle
/usr/lib64/ruby/gems/1.9.1/cache/bundler-1.0.21.gem
/usr/lib64/ruby/gems/1.9.1/specifications/bundler-1.0.21.gemspec
/usr/lib64/ruby/gems/1.9.1/doc/bundler-1.0.21
/usr/lib64/ruby/gems/1.9.1/gems/bundler-1.0.21

%clean
rm -rf %{buildroot}
