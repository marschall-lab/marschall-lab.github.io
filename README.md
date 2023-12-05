# The Marschall Lab

## Adding content - if you break it, you fix it!

Only pushes to the `master` branch will trigger a new website build. If you need to prepare
bigger content updates (e.g., new posts with extensive project descriptions), create a new
branch in the website repository and push your unfinished changes there.

### Building locally

Before pushing any changes, build the website on your local machine and check if the changes
look as expected - if they don't, don't push them to the repo...

#### 0. Clone the website repository

`git clone https://github.com/marschall-lab/marschall-lab.github.io`

#### 1. Create Conda environment

`conda env create -f marschall-lab.github.io/build_env/conda_jekyll.yml -p ./website_env`

`conda activate ./website_env`

#### 2. Install necessary packages

Use your favorite package manager to install `ruby` and `ruby-devel`
or equivalent, if they aren't already.

```bash
gem install jekyll  # Simple, blog-aware, static site engine
gem install jekyll-paginate  # for multipage blog listings
gem install jekyll-feed  # for Atom (RSS-like) feed
gem install jekyll-sitemap  # for web crawlers
```

#### 3. Build and serve the website

```bash
cd marschall-lab.github.io/
bundler install
bundle exec jekyll build --watch --incremental
```

If jekyll gives an error like the following:

```bash
$ bundle exec jekyll
~/marschall-lab.github.io/website_env/share/rubygems/bin/jekyll: 6: exec: ~/marschall-lab.github.io/website_env/share/rubygems/bin/ruby: not found
```

... you can work around this garbage with the following hack (change the path to your home and environment directories):
```
ln -fs ~/marschall-lab.github.io/website_env/bin/ruby ~/marschall-lab.github.io/website_env/share/rubygems/bin/ruby
```

Then try the previous jekyll command again.

```bash
bundle exec jekyll serve --livereload -P 4000
# Server address: http://127.0.0.1:4000/
```

Note the `http` and not `https`; you will get SSL errors if using the latter, which is now often injected into the url if not specifying explicitely the protocol in the address bar.

#### 4. Adding content

Each directory contains a README describing the
necessary formatting.

##### Personal page:

[Personal page README](_people/README.txt)

Markdown file under:

`_people/`

Portrait (PNG/JPG) under:

`img/`

##### Publication page:

[Publication page README](_data/publications/README.txt)

YAML file under:

`_data/publications`

##### Project page:

[Project page README](_projects/README.txt)

Markdown file under:

`_projects/`

##### News (post) page:

[News page README](_posts/README.txt)

Markdown file under:

`_posts/`

##### New institute / lab

[Institute page README](_institutes/README.txt)

Markdown file under:

`_institutes/`

Logo (PNG/JPG) under:

`img/`


#### 5. Theming

For reference, the colors used for the website are, in RGB hexcodes:

- #edd6ff: Pink Lace, masthead background
- #3a3b3c: Sections header

Logo colors:

- #819ebb: Air Superiority Blue, light blue
- #0b2e4f: Prussian Blue, dark blue

See also: [Logo README](img/group-logo/README.md).
