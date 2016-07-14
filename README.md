# workstation cookbook

## Description

This cookbook will configure various settings, and install preferred
applications. Given the highly personal nature of a workstation configuration,
these settings are things that suit me and my personal work style. YMMV
disclaimers naturally apply.

This is my first take on a workstation configuration cookbook, similar to
this [github repo](https://github.com/jtimberman/workstation-chef-repo) and
[related](http://jtimberman.housepub.org/blog/2011/04/03/managing-my-workstations-with-chef/)
[blog](http://jtimberman.housepub.org/blog/2011/09/04/update-to-managing-my-workstations/)
[posts](http://jtimberman.housepub.org/blog/2012/07/29/os-x-workstation-management-with-chef/)
by [Josh Timberman](https://github.com/jtimberman). Other notable influences include
[Pivotal Sprout](https://github.com/pivotal-sprout)
by [Pivotal Labs](https://github.com/pivotal),
[Bootstrap](https://github.com/bleything/bootstrap)
by [Ben Bleything](https://github.com/bleything),
and [workstation-bootstrap](https://github.com/joemiller/workstation-bootstrap)
by [Joe Miller](https://github.com/joemiller).

I install ChefDK via the excellent
[chefdk-bootstrap](https://github.com/Nordstrom/chefdk_bootstrap)
script by [Nordstrom](https://github.com/Nordstrom) to provide the required
chef-client installation, as well as the basic/standard Chef development tools
that I use on a daily basis.

It is very much an early iteration, and there are many, many aspects of the
above influences that I will likely adopt over time to make it more
maintainable, and/or if I get ambitious enough to try turning it into
something usable for a broader audience.

## Testing

To support a TDD approach to working on this project, I leveraged the
[osx-vm-templates](https://github.com/timsutton/osx-vm-templates) project
to build an OS X vagrant box, as outlined in
[this article](https://spin.atomicobject.com/2015/11/17/vagrant-osx/), which I
use in test-kitchen for automated testing with
[Chef Inspec](https://www.chef.io/inspec/)
