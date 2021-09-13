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

`conda env create -f marschall-lab.github.io/build_env/jekyll.yml -p ./website_env`

`conda activate ./website_env`

#### 2. Install necessary packages

```bash
gem install jekyll  # Simple, blog-aware, static site engine
# gem install jekyll-paginate  # for multipage blog listings
# gem install jekyll-feed  # for Atom (RSS-like) feed
# gem install jekyll-sitemap  # for web crawlers
```

#### 3. Build and serve the website

```bash
cd marschall-lab.github.io/
bundler install
bundle exec jekyll build --watch --incremental
```

```bash
bundle exec jekyll serve --livereload
# Server address: http://127.0.0.1:4000/
```

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
