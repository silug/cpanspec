use strict;
use warnings;
use Module::Build;

my $class = Module::Build->subclass(
    class => 'CpanSpec::Build',
    code => q{
        use File::Basename qw(dirname);
        use FindBin;

        sub ACTION_build {
            my $self = shift;
            $self->SUPER::ACTION_build(@_);
            symlink("cpanspec", "$FindBin::Bin/blib/script/cpanget");
            symlink("cpanspec.1p", "$FindBin::Bin/blib/bindoc/cpanget.1p");
        }
    }
);

my $builder = $class->new(
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
        'Module::CoreList'              => 0,
        'Module::ExtractUse'            => 0,
        'POSIX'                         => 0,
        'Parse::CPAN::Packages'         => 0,
        'Pod::Simple::TextContent'      => 0,
        'Pod::Usage'                    => 0,
        'Text::Autoformat'              => 0,
        'YAML'                          => 0,
    },
    script_files => [
        'cpanspec',
    ],
);

$builder->create_build_script();

# vi: set ai et:
