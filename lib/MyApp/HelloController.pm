package MyApp::HelloController;
use strict;
use warnings;
use Railsish::Controller;

sub index {
    render(title => "Hello");
}

sub world {
    our $world = 'Hello';
    render;
}

1;
