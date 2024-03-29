Overall site config
-------------------

   _data/settings.yml

Settings here include what to show on the landing page.


Editing/adding news posts (section "News")
------------------------------------------

   _posts/*.md

Add your new file under the folder `_posts`.

File names should start with a date in the form YYYY-MM-DD. The format is
Markdown, but files begin with "front matter" between two "---" lines, which
is YAML formatted and used for metadata. Current (optional) front matter
variables used:

  title: The title of the post (the file name without the leading date or any
         dashes is used if missing)
  authors: List of authors, keyed to file names in _people/, but without ".md"
           (http://yaml.org/type/seq.html)
  excerpt: Optional short description to show in lists. If not provided,
    everything up to excerpt_separator (defined in _config.yml) will
    be used, or the entire post if there is no delimiter.
  excerpt_separator: Define your own excerpt delimiter for the post.
  comments: Currently off by default; set to true to enable
            (http://yaml.org/type/bool.html)

Standard Markdown (http://daringfireball.net/projects/markdown/) is accepted
and will be rendered in the style of the site. It is not recommended to use H1
headers (single flanking "#" or "="-underline) within posts, since they would
appear the same size as the post title. Pure HTML can be used within Markdown,
which is useful, for example, for centering images:

  <div style="text-align:center;"><img src="…"/></div>


Editing/adding data
-------------------

   _people/*.md
   _projects/*.md
   _data/publications/*.yml

For People and Projects, file names will be used for sorting, and the prefixes
for these and for Publications (no ".md" or ".yml") can be used as keys for
cross-referencing in the YAML "front matter" (between the "---" lines). Though
files for People and Projects are Markdown formatted, the data in their YAML
front matter is used to generate their corresponding pages, and Markdown content
below this is currently ignored. Publications are only used as a data source and
do not have individual pages, hence the pure YAML format. See existing files for
relevant variables and syntax or the complete schema:

  schema.pptx

Images can be placed in img/ and can be referenced from YAML as "/img/[...]",
including any subdirectories.
