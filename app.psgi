use Plack::Builder;

builder {
    # These files can be served directly
    enable 'Static',
        path => qr{\.(gif|png|jpg|swf|ico|mov|mp3|pdf|js|css)$},
        root => "./include";
    
    enable 'TemplateToolkit',
        INCLUDE_PATH => "./tt",    # required
        extension    => '.tt',
        pass_through => 1;        # delegate missing templates to $app
    
    $app;
}
