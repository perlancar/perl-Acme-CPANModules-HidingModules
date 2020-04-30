package Acme::CPANModules::HidingModules;

# AUTHORITY
# DATE
# DIST
# VERSION

our $text = <<'_';

So you want to convince some Perl code that some modules that are actually
installed, aren't? There are several ways to accomplish this, with different
effects and levels of convincing. This list details them.

**Why?**

First of all, why would you want to do this? Almost always, the answer is: for
testing purposes. For example, you want to make sure that your code can work
without an optional module. Or, alternatively, you want to test how your code
fails under the absence of certain modules.


**Making modules not loadable**

Most of the time, you just want to make certain modules not loadable. That is,
making `require SomeModule` or `use Module` fail. To do this, you usually
install a hook at the first element of `@INC`. The hook would die when it
receives a request to load a module that you want to hide. Some tools that work
this way include:

<pm:lib::filter> family, including its thin wrapper <pm:lib::disallow>.
lib::filter et al supports hiding modules that you specify, as well as hiding
all core modules or all non-core modules. They also support recursive allowing,
i.e. you want to allow Moo and all the modules that Moo loads, and all the
modules that they load, and so on.

<pm:Devel::Hide>. Devel::Hide also works by installing a hook in `@INC`. It
supports propagating the hiding to child process by setting PERL5OPT environment
variable.

<pm:Test::Without::Module>.


**Fooling module path finders**

Depending on which tool you use to find a module's path, here are some patches
you can load to fool the finder.

<pm:Module::Path::Patch::Hide>

<pm:Module::Path::More::Patch::Hide>


**Fooling module listers**

Depending on which tool you use to find a module's path, here are some patches
you can load to fool the lister tool.

<pm:Module::List::Patch::Hide>

<pm:PERLANCAR::Module::List::Patch::Hide>

<pm:Module::List::Tiny::Patch::Hide>

<pm:Module::List::Wildcard::Patch::Hide>


**Hard-core hiding**

To fool code that tries to find the module files themselves without using any
module, i.e. by iterating @INC, you will need to actually (temporarily) rename
the module files. <pm:App::pmhiderename> and <lib::hiderename> does this.

_

our $LIST = {
    summary => 'Hiding modules',
    description => $text,
    tags => ['task'],
    entries => [
        map { +{module=>$_} }
            do { my %seen; grep { !$seen{$_}++ }
                 ($text =~ /<pm:(\w+(?:::\w+)+)>/g)
             }
    ],
};


1;
# ABSTRACT:
