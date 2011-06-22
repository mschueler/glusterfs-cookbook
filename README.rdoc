= DESCRIPTION:

Minimal Ubuntu style glusterfs replication cookbook.

= REQUIREMENTS: 

It's been tested on ubuntu 10.04.

It only configures a glusterfs volume in replication node in every glusterfs server. It should be quite easy to extend tough.

= ATTRIBUTES:

  * export directory for the servers. 
  * import directory for the clients.

= USAGE:

A role named glusterfs-server is required, this node should contain at least server recipe. Client recipe looks for all the nodes within this role in order to create client configurations.

= LICENSE & AUTHOR:

Author:: Jacobo García (<jacobo.garcia@gmail.com>)
Copyright:: 2010, Jacobo García.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


