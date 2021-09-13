Project page format
================

The file name must be

toolname.md

The content must be formatted as follows:

---
name: TOOL NAME
date: "YYYY-MM-DD"
home: LINK TO INFO DOCS [README, RTD etc.]
source: LINK TO GITHUB REPO
download: LINK TO GITHUB RELEASES
retired: y (if tool no longer maintained)
desc:
A brief yet informative description of the software

pubs:
- cross-reference publications (basename of publication YML file w/o ".yml")

people:
- cross-reference people (basename of people markdown file w/o ".md")
---