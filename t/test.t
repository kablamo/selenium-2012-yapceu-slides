use Test::Most;
use Test::WWW::Selenium;

my $s = Test::WWW::Selenium->new( 
    host           => "localhost",
    port           => 4444,
    browser        => "*firefox",
    browser_url    => "http://localhost:5000",
);

$s->open_ok("/index.tt");
$s->wait_for_page_to_load_ok;
$s->type_ok(searchInput => "cat pictures");
$s->click_ok("searchButton");
$s->wait_for_page_to_load_ok;
$s->is_text_present_ok('2 bajillion results');

done_testing;
