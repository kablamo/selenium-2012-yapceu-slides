use Test::Most;
use Test::WWW::Selenium;

my $s = Test::WWW::Selenium->new( 
    host           => "localhost",
    port           => 4444,
    browser        => "*firefox",
    browser_url    => "http://localhost:5000",
);

$s->open_ok("/index.tt");               sleep 2;
$s->wait_for_page_to_load_ok;           sleep 2;
$s->type_ok(searchInput => "cat pics"); sleep 2;
$s->click_ok("searchButton");           sleep 2;
$s->wait_for_page_to_load_ok;           sleep 2;
$s->is_text_present_ok('2 bajillion results');

done_testing;
