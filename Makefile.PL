use ExtUtils::MakeMaker;

# okay, complain about not having a nice version of Scalar::Util
# if they don't have one

eval "use Scalar::Util qw(openhandle)";

unless (defined(&openhandle))
{
  print STDERR <<EOW ;
WARNING: You don't have a modern version of Scalar::Util installed
this is a recommended (but not required) module.  See the BUGS
section of Template::Plugin::XML::LibXML's pod for more infomation.
EOW
}

# write the makefile

WriteMakefile(
    'NAME' => 'Template-Plugin-XML-LibXML',
    'VERSION_FROM' => 'lib/Template/Plugin/XML/LibXML.pm',

    # note, this might work with Template Toolkit's before 2.06, and
    # XML::LibXML before 1.52, but I haven't tried it so I make no
    # guarentees
    'PREREQ_PM' => { Template                => 2.06,
		     XML::LibXML             => 1.52,
                   },

    'ABSTRACT_FROM' => 'lib/Template/Plugin/XML/LibXML.pm',
    'AUTHOR' => 'Mark Fowler <mark@twoshortplanks.com>',
);
