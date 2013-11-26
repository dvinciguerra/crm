package BackWrite::Model;
use Mojo::Base -strict;

use BackWrite::App::Class::Loader;

sub load {
    my ( $class, $package, @args ) = @_;

    my $instance = 
        BackWrite::App::Class::Loader->load("BackWrite::Model::${package}");

    return $instance
      if $instance && $instance->isa('BackWrite::Model::Base');
}

sub exists {
    my ( $class, $package ) = @_;
    return BackWrite::App::Class::Loader->exists("BackWrite::Model::${package}")
        if $package;
}

1;

__END__
=pod 

=head1 NAME

BackWrite::Model - Model factory for BackWrite app


=head1 SINOPSYS

    use BackWrite::Model;

    # getting new instance of User model if exists
    my $user_model = BackWrite::Model->load('User');


=head1 DESCRIPTION

This class is a simple factory that load and instanciate for provide a simple
way to get new instances of L<BackWrite> model classes.

This class is auto configured to find model classes under L<BackWrite::Model>
namespace.


=head2 Methods


=head3 load(C<$scalar>)

This method get a class name, find under namespace and (if exists) return an
instance of class if it is a son class of BackWrite::Model::Base

    package BackWrite::Model::User;
    use base 'BackWrite::Model::Base';

    # use here your favorite ORM our handle manually
    ...

And now you can load User class doing:

    use BackWrite::Model;

    # get BackWrite::Model::User class instance
    my $user_model = BackWrite::Model->load('User');


=head3 exists(C<$scalar>)

This method returns if class exists based on required inplementation.

    my $user_model;

    # load user model if exists
    $user_model = BackWrite::Model->load('User') 
        if BackWrite::Model->exists('User');


=head1 AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
