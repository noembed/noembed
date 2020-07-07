package Noembed::Provider::SWITCHTube;

use Web::Scraper;

use parent 'Noembed::Provider';

sub patterns {
  'https://tube.switch.ch/videos/([a-z0-9]+)',
  'https://tube.switch.ch/cast/videos/(\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b)'
}
sub options { qw/width height/}
sub provider_name { "SWITCHTube" }


sub prepare_provider {
  my $self = shift;
  $self->{scraper} = scraper {
    process 'title', title => 'TEXT';
  };
}

sub serialize {
  my ($self, $body, $req) = @_;
  my $data = $self->{scraper}->scrape($body);
  my $src = $req->url =~ s/videos/embed/r;
  return  +{
    html => "<iframe width='640' height='360' src='".$src."' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
    title => $data->{title},
    width => 640,
    height => 360,
    type => 'video',
    provider_url => 'https://tube.switch.ch/',
  };
}

1;
