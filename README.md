# w5-graph

World Wide Web Who's Who

## Structure

The YAML file is a map of nodes, where the top level is the name of a node.

Properties on nodes:

### type

At the high level, node types basically break down into `person` nodes, and
all other nodes.

The other types of nodes have looser types that can be vaguely broken down into
two different kinds:

- Subjects
  - `project`
  - `spec`, `standard` (`standard` is basically a body of `spec` nodes)
  - `browser`
  - `library`
- Organization units
  - `location` (physical location)
  - `company`, `organization` (closed or semi-closed membership)
    - If you work for it, it's a company, if you're a member of it, it's an
      organization
  - `network` (open membership)
    - Twitter, Tumblr, and GitHub are networks
  - `forum` (closer-knit community)
  - `issues` (bug tracker)
  - `site` (static domain)

### info

A short bio or description of the node's subject.

### image

The URL of an image that can represent that node. (Should work when cropped to
a circle.)

### href

A canonical URL for the node's subject.

### urls

A map of other URLs related to the node, by subject (ie. "Twitter" for a
person's Twitter account, "crbug" for a specification's implementation
issue on the Chromium issue tracker).

### rels

Edges from this node to others, as a map of names or arrays of names. See the
guidelines below for how to structure rels.

## Guidelines

These are just some rules of thumb to follow when defining nodes to keep the
graph meaningful.

### Try to copy the closest applicable existing convention

There should only really be a divergence from the existing nomenclature when
the divergent property could be used in several other cases to better
understand the meaning in the graph on the aggregate (eg. showing all
companies)

### One rel per pair, directed by action

Directed edges generally go from smaller nodes to bigger ones, keeping the
number of edges out from each node roughly on the same order of magnitude. If
a `rels` property is a very large array, it's probably the wrong way around.

Edges come from the point of concern: it's a bigger deal for a spec to be
"implemented by" a browser than a browser to "implement" a spec (although
*people* **do** implement specs). Similarly, "forked from" goes from the fork
to the source.

These concerns are usually active rather than passive: "requires" is a rel,
"is required by" is just "requires" backwards.

### Companies are not their products, and products are not their networks

"GitHub, Inc." is different from GitHub the website, and working *using* GitHub
is different from working *to develop* GitHub.

Since the goal of this is to visualize connections, companies have distinct
nodes separate from their flagship products, and those products are only listed
if they have a significant role in the communication and development activities
of the people on the graph (so Google-the-search-engine doesn't have a node).

For situations where the set of people working on a product is a significant
subset of emplyees within the company, they should be grouped based on what
*component* of the project they work on (eg. the frontend or backend).
