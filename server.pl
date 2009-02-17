use strict;
use warnings;
use lib 'lib';
use Cwd;
use HTTP::Engine;
use HTTP::Engine::Middleware;
use HTTP::Request;

BEGIN { $ENV{APP_ROOT} = getcwd };

use MyApp;

my $middleware = HTTP::Engine::Middleware->new;
$middleware->install(
    'HTTP::Engine::Middleware::Static' => {
        regexp  => qr{^/(favicon.ico|robots.txt|memo.txt)$},
        docroot => 'app/static/',
    },
);

my $engine = HTTP::Engine->new(
    interface => {
        module => 'ServerSimple',
        args => { port => '1300' },
        request_handler => $middleware->handler( \&MyApp::handle_request ),
    }
)->run;
