# Spatial statistics

This Dockerfile came from a repository that I used to create what I
called "a reproducible review", i.e. it is a review manuscript but
where most of the figures are actively generated rather than simply
being copied from previous papers.  (The first figure is a drawing of the
retina, and so is simply included, but all other figures are generated
by running code in the project.)

## Review and changes

- The version of the "verse" from rocker is specified.
- The deprecated MAINTAINER field was replaced by a label.
- Most comments in the original referred to older versions of the
Dockerfile.  These comments have been removed.
- New comments have been added to better reflect our guidelines,
describing how to use the container, and how to lint the file.

  

