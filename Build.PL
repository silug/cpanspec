use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    dist_name           => 'cpanspec',
    license             => 'perl',
    dist_author         => 'Steven Pritchard <steve@cpan.org>',
    dist_version_from   => 'cpanspec',
    requires => {
        'Archive::Tar'                  => 0,
        'Archive::Zip'                  => 0,
        'IO::Uncompress::Bunzip2'       => 0,
        'File::Basename'                => 0,
        'FileHandle'                    => 0,
        'Getopt::Long'                  => 0,
        'locale'                        => 0,
        'LWP::UserAgent'                => 0,
        'POSIX'                         => 0,
        'Parse::CPAN::Packages'         => 0,
        'Pod::Simple::TextContent'      => 0,
        'Pod::Usage'                    => 0,
        'Text::Autoformat'              => 0,
        'YAML'                          => 0,
    },
    script_files => [
        'cpanspec',
        'cpanget',
    ],
);

$builder->create_build_script();

# vi: set ai et:
