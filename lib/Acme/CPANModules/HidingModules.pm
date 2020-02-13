package Acme::CPANModules::HidingModules;

# AUTHORITY
# DATE
# DIST
# VERSION

our $text = <<'_';

So you want to convince some Perl code that some modules that are installed,
aren't (usually for testing purposes)? There are several ways to go about it,
with different effects and levels of convincing.

**Loading modules**

Most of the time, you just want to make certain modules not loadable (by
`require` or `use`). To do this, you usually install a hook at the first element
of `@INC`. The hook would die when it receives a request to load a modules that
you want to hide. Some tools that work this way include:

<pm:lib::filter> family, including its thin wrapper <pm:lib::disallow>.
lib::filter supports hiding (non-)core modules in addition to the specific ones
you mentioned. It also supports recursive allowing (i.e. you want to allow Moo
and all the modules that Moo loads, and all the modules that they load, and so
on).

<pm:Devel::Hide>, which also plans to support hiding (non-)core modules.

<pm:Test::Without::Module>.


**Finding module's path**

Depending on which tool you use to find a module's path, here are some patches
you can load to fool the finder tool.

<pm:Module::Path::Patch::Hide>

<pm:Module::Path::More::Patch::Hide>


**Listing installed modules**

Depending on which tool you use to find a module's path, here are some patches
you can load to fool the lister tool.

<pm:Module::List::Patch::Hide>

<pm:PERLANCAR::Module::List::Patch::Hide>

<pm:Module::List::Tiny::Patch::Hide>

<pm:Module::List::Wildcard::Patch::Hide>


**Hard-core hiding**

To fool code that tries to find the module files themselves without using any
module, i.e. by iterating @INC, you will need to actually (temporarily) rename
the module files. L<pm:App::pmhiderename> and L<lib::hiderename> does this.

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
