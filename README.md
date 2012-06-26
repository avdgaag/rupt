# Pivot

**Note** this is a prototype project to play around with creating a nice
command-line interface. It works, but is still a little rough around the edges.

Pivot is a command-line interface for [Pivotal Tracker][1]. It allows
developers to review stories, add comments and tasks, and update story progress
right from the command line.

Here's a quick example:

    # List all stories for the current iteration
    $ pt current
    Feature 123456 3  Unstarted   As a user I want to publis blog posts
    # Mark the story as In progress
    $ pt start 123456
    # Add a comment
    $ pt comment 123456 --add "Great feature. Will be finished today."
    # Review open tasks for the story
    $ pt tasks 123456
    - 34890 Add a the post model
    - 34891 Ask John for the design
    - 34892 Integrate with current feed
    # Mark the first task as done
    $ pt tasks 12346 --check 34890

[1]: http://www.pivotaltracker.com

## Installation

Pivot is released as a Ruby Gem. Ruby and Rubygems should come pre-installed on
most non-Windows systems. Install it like so:

    $ gem install pivot

You can validate the installation process by running `pt --version`. You should
see something like `pt 0.0.1`.

## Usage

### Global options

Scope operations to a project:

    $ pt --project 12345

Scope operations to use a specific API token:

    $ pt --token 1a2b3c4e5f6g

### Authentication

Log in to Pivotal Tracker once to retrieve your API key:

    $ pt auth
    Email:
    Password:

This will store your personal token in ~/.pivot. You can override which token
to use using the `--token` global option. Then, pick a project for your current
project:

    $ pt project

This will let you pick one of your projects from Pivotal Tracker and store its
ID in ./.pivot. You can override which project to use with the global
`--project` option.

### Listing backlog items

List all user stories in current iteration:

    $ pt current
    Feature 123456 3 Started    As a user I want to write a post (John)
    Choe    654321 8 Deliverded As as user I want to comment on a post (Frank)

List all bugs in the backlog owned by John:

    $ pt backlog --owner John --type bug

### Working with items

Re-assign item:

    $ pt assign 123456 --to GK

Change item status:

    $ pt [deliver|finish|accept|reject|start] 12345

Show a complete user story:

    $ pt show 123456
    Title:        As a user I want to publish a blog post
    Decription:   Fully description goes here
    Owner:        Arjan van der Gaag (AG)
    Requested by: Mieke Verhagen (MV)
    Estimate:     3
    Type:         story

### Working with comments and tasks

Comment on an item:

    $ pt comment 123456 -m "This is my new comment"

Show the latest comments in chronological order:

    $ pt comments 123456

    MV 2012-03-12 12:34 Dit is een eerste reactie
    MV 2012-03-12 12:34 Dit is een tweede reactie

Show a story's tasks:

    $ pt tasks 123456
    1 [done] Create a model
    2 [done] Write some tests
    3        Publish to staging

Mark a task as finished or unfinished:

    $ pt tasks 123456 --[un]check 1

### Extra 

Create a new feature branch for a story based on its type, name and ID:

    $ pt branch 123456

Open a story in the browser client:

    $ pt open 123456

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
