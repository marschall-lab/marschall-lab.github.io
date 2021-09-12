Publication page format
=======================

Use the Perl script under "/scripts" to convert a RIS formatted
citation (e.g., created and downloaded from PubMed) to the below
YAML formatted file:

The file name must be "YYYY-MM-DD-LastNameOfFirstAuthor.yml"


title: must be in quotes if includes ':' or '-' characters
authors: Surname Initials, ...
text: open-access DOI links (use pubmed or preprint link if pub behind paywall)
date: "YYYY-MM-DD format", must be in quotes
journal: use pubmed abbreviations
pubmed: pubmed identifier
