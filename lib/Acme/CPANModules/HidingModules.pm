package Acme::CPANModules::HidingModules;

# DATE
# VERSION

our $LIST = {
    summary => 'Simulate the unavailability of modules',
    description => <<'_',

The tools listed here can simulate the absence of modules, usually for testing
purposes. For example, you have Foo::Bar installed but want to test how your
code would behave when Foo::Bar is not installed.

These tools usually work by installing a require() hook in `@INC`. If the hook
sees that you are trying to load one of the target modules, it dies instead.

_
    entries => [
        {module=>'lib::filter'},
        {module=>'lib::disallow'},
        {module=>'Devel::Hide'},
        {module=>'Test::Without::Module'},
        {module=>'Module::Path::Patch::Hide', summary=>'This only hides modules from Module::Path'},
        {module=>'Module::Path::More::Patch::Hide', summary=>'This only hides modules from Module::Path::More'},
        {module=>'Module::List::Patch::Hide', summary=>'This only hides modules from Module::List'},
        {module=>'PERLANCAR::Module::List::Patch::Hide', summary=>'This only hides modules from PERLANCAR::Module::List'},
    ],
};

1;
# ABSTRACT:
