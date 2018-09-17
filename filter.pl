#!/usr/bin/env perl
use v5.14;

use Pandoc::Filter;
use Pandoc::Elements;
use Pandoc;

sub section_number {
	state @section;

	return Str '' if $_->match('.unnumbered');

	my $h = shift;
	my $level = $h->level;

	$section[-1]++ if @section == $level;
	pop @section while @section > $level;
	push @section, 1 while @section < $level;

	return Str join('.', @section, ''), Space;
}

my $headers = sub {
    # TODO: set id by section number, e.g. '2.1'
	Header $_->level + 2, $_->attr, [ section_number($_), @{$_->content} ];
};

pandoc_filter 
	Header => $headers,
	CodeBlock => sub {
        return if $_->class ne 'include';

        my @lines = split "\n", $_->content;

        return [
            map {
                -e $_ ? do {
		            my $doc = pandoc->file($_);
                    $doc->transform( Header => $headers );
                    @{$doc->content};
                } : Null
            } @lines ];
	};
