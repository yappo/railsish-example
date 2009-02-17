package MyApp::WelcomeController;
use strict;
use warnings;
use Railsish::Controller;

sub index {
    render(title => "Root");
}

1;

