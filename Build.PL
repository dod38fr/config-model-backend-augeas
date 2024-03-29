#    Copyright (c) 2008-2011 Dominique Dumont.
#
#    This file is part of Config-Model-Backend-Augead.
#
#    Config-Model is free software; you can redistribute it and/or
#    modify it under the terms of the GNU Lesser Public License as
#    published by the Free Software Foundation; either version 2.1 of
#    the License, or (at your option) any later version.
#
#    Config-Model is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Lesser Public License for more details.
#
#    You should have received a copy of the GNU Lesser Public License
#    along with Config-Model; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
#    02110-1301 USA

use Module::Build;

use warnings FATAL => qw(all) ;
use strict ;

require 5.008;

print "Note: Augeas integration tests require Augeas library > 0.3.3\n\n";

my $build = Module::Build->new
  (
   module_name    => 'Config::Model::Backend::Augeas',
   license        => 'LGPL_2_1',
   dist_abstract  => 'Read and write configuration data through Augeas',
   dist_author    => 'Dominique Dumont (ddumont at cpan dot org)',
   configure_requires => { 'Module::Build' => '0.36' },
   requires       => {
		      'Log::Log4perl'     => '1.11', # for TRACE log level
		      'Config::Augeas'    => '0.303',
		      'Config::Model'     => '2.117',
		      'Mouse'             => 0,
		     },
   build_requires => {
       'Config::Model'     => '2.117',
       'Config::Model::Itself' => '2.012', # for t/model_extension.t
       'Config::Model::Tester' => '3.006', # for init_test() calls
       'Test::More'        => 0,
       'Test::Exception'   => 0,
       'Test::Differences' => 0,
       'version'           => '0.77'
   },

   # cleanup required by t/augeas_backend.t
   add_to_cleanup => [qw/wr_root r_root/],
  );

$build->add_build_element('pl');
$build->create_build_script;
