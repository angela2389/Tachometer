
# Delete all resources (in inverse order of appearence please!)

Projects.delete_all
# Teams.delete_all
# Phases.delete_all
# Sprints.delete_all
# Experiments.delete_all
User.delete_all

# Users

user1 = User.create( email: 'stefano@ex.com', password: 'abcd1234' )
user2 = User.create( email: 'marc@ex.com', password: 'abcd1234' )
user3 = User.create( email: 'christiaan@ex.com', password: 'abcd1234' )
user4 = User.create( email: 'angela@ex.com', password: 'abcd1234' )
user5 = User.create( email: 'timmo@ex.com', password: 'abcd1234' )
user6 = User.create( email: 'douwe@ex.com', password: 'abcd1234' )

# Experiments


# Sprints


# Phases


# Teams


# Projects

project1 = Project.create(
  name: "project ipsum 1",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true
)
project2 = Project.create(
  name: "project ipsum 2",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true
)
