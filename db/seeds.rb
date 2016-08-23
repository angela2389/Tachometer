
# Delete all resources (in inverse order of appearence please!)

Project.delete_all
# Team.delete_all
# Phase.delete_all
# Sprint.delete_all
# Experiment.delete_all
User.delete_all

# Users

user1 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )
user2 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )
user3 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )
user4 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )
user5 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )
user6 = User.create( email: 'tachometero7@gmail.com', password: 'abcd1234' )

# Experiments


# Phases (project/phase)

phase1_1 = Phase.create( sequence: 0, interval: 1 )
phase1_2 = Phase.create( sequence: 1, interval: 1 )
phase1_3 = Phase.create( sequence: 2, interval: 1 )
phase1_4 = Phase.create( sequence: 3, interval: 1 )

phase2_1 = Phase.create( sequence: 0, interval: 1 )

# Sprints (project/phase/sprint)
sprint1_1_1 = Sprint.create(
  start_date: Date.today - 2,
  end_date: Date.today + 5,
  completed: false,
  phase: phase1_1
)
sprint1_1_2 = Sprint.create(
  start_date: Date.today + 6,
  end_date: Date.today + 13,
  completed: false,
  phase: phase1_1
)

# Teams (project/phase/team)

team1_1_1 = Team.create( phase: phase1_1 )

# Team Members (project/phase/team/user)

team_members1_1_1_1 = TeamMember.create(team: team1_1_1, user: user1, role: "Product Owner")
team_members1_1_1_2 = TeamMember.create(team: team1_1_1, user: user2, role: "Team Member")

# Projects

project1 = Project.create(
  name: "project ipsum 1",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  current_stage_id: phase1_1.id
)
project2 = Project.create(
  name: "project ipsum 2",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  current_stage_id: phase2_1.id
)

project3 = Project.create(
  name: "project ipsum 3",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: false
)

project4 = Project.create(
  name: "project ipsum 4",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: false
)

project5 = Project.create(
  name: "project ipsum 5",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true
)
