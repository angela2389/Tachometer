# Delete all resources (in inverse order of appearence please!)
Sprint.delete_all
Experiment.delete_all
TeamMember.delete_all
Team.delete_all
Phase.delete_all
Project.delete_all
User.delete_all

# Users

user1 = User.create( email: 'tachometero1@gmail.com', password: 'abcd1234', first_name: 'Joop', last_name: 'Braakhekke', role: 'user')
user2 = User.create( email: 'ruben@sloote.nl', password: 'abcd1234', first_name: 'Ruben', last_name: 'Sloote', role: 'user' )
user3 = User.create( email: 'tachometero3@gmail.com', password: 'abcd1234', first_name: 'Anna', last_name: 'Van der Breggen', role: 'user' )
user4 = User.create( email: 'tachometero4@gmail.com', password: 'abcd1234', first_name: 'Koen', last_name: 'Verweij', role: 'user' )
user5 = User.create( email: 'tachometero5@gmail.com', password: 'abcd1234', first_name: 'Lodewijk', last_name: 'Napoleon', role: 'user' )
user6 = User.create( email: 'doris@gmail.com', password: 'abcd1234', first_name: 'Doris', last_name: 'Dromer', role: 'admin' )
user7 = User.create( email: 'miriam@tocino.com', password: 'abcd1234', first_name: 'Miriam', last_name: 'Tocino', role: 'admin' )
# Experiments

# Projects

project1 = Project.create(
  name: "Referbot",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  user: user1,
  portfoliomanager_id: user6.id
  # current_stage_id: phase1_1.id
)
project2 = Project.create(
  name: "Hotel Dry Rest",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: false,
  user: user2,
  portfoliomanager_id: user6.id
  # current_stage_id: phase2_1.id
)

project3 = Project.create(
  name: "Hackertees",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  user: user3,
  portfoliomanager_id: user6.id
)

project4 = Project.create(
  name: "Forum",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  user: user2,
  portfoliomanager_id: user7.id
)

project5 = Project.create(
  name: "Useless products",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: false,
  user: user4,
  portfoliomanager_id: user7.id
)

project6 = Project.create(
  name: "Help for hire",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  active: true,
  user: user5,
  portfoliomanager_id: user7.id
)

# Phases (project/phase)

phase1_1 = Phase.create(
  start_date: Date.today - 2,
  end_date: Date.today + 28,
  completed: false,
  sequence: 0,
  interval: 1,
  project: project1
  )
phase1_2 = Phase.create(
  start_date: Date.today + 29,
  end_date: Date.today + 59,
  completed: false,
  sequence: 1,
  interval: 1,
  project: project1
  )
phase1_3 = Phase.create(
  start_date: Date.today + 60,
  end_date: Date.today + 91,
  completed: false,
  sequence: 2, interval: 1,
  project: project1
  )
phase1_4 = Phase.create(
  start_date: Date.today + 92,
  end_date: Date.today + 123,
  completed: false,
  sequence: 3,
  interval: 1,
  project: project1 )

phase2_1 = Phase.create(
  start_date: Date.today - 30,
  end_date: Date.today - 1,
  completed: true,
  sequence: 0,
  interval: 1,
  project: project2
  )

phase2_2 = Phase.create(
  start_date: Date.today,
  end_date: Date.today + 30,
  completed: false,
  sequence: 1,
  interval: 1,
  project: project2
  )

phase3_1 = Phase.create(
  start_date: Date.today - 60,
  end_date: Date.today + 30,
  completed: true,
  sequence: 0,
  interval: 1,
  project: project3
  )

# Add current_stage_id

project1.current_stage_id = phase1_1.id; project1.save
project2.current_stage_id = phase2_2.id; project2.save
project3.current_stage_id = phase3_1.id; project3.save



# Teams (project/phase/team)

team1_1_1 = Team.create( phase: phase1_1 )

# Team Members (project/phase/team/user)

team_members1_1_1_1 = TeamMember.create(team: team1_1_1, user: user1, role: "Product Owner")
team_members1_1_1_2 = TeamMember.create(team: team1_1_1, user: user2, role: "Team Member")

# Experiments (project/phase/sprint/experiment)

experiment1_1_1_A = Experiment.create(
  name: "Experiment lorem ipsum A",
  start_date: Date.today - 2,
  end_date: Date.today,
  completed: true,
  phase: phase1_1,
  team: team1_1_1,
  interviews_planned: 10,
  interviews_done: 11,
  early_adopters_planned: 100,
  early_adopters_converted: 85,
  domain: "Lorem ipsum dolor sit amet",
  assumption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  method: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  observation: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  measure: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  learned: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  success_criteria: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  action: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum."
)

experiment1_1_1_B = Experiment.create(
  name: "Experiment lorem ipsum B",
  start_date: Date.today - 2,
  end_date: Date.today + 1,
  completed: false,
  phase: phase1_1,
  team: team1_1_1,
  interviews_planned: 20,
  interviews_done: 30,
  early_adopters_planned: 20,
  early_adopters_converted: 25,
  domain: "Lorem ipsum dolor sit amet",
  assumption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  method: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  observation: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  measure: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  learned: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  success_criteria: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  action: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum."
)

experiment1_1_1_C = Experiment.create(
  name: "Experiment lorem ipsum C",
  start_date: Date.today,
  end_date: Date.today + 5,
  completed: false,
  phase: phase1_1,
  team: team1_1_1,
  interviews_planned: 10,
  interviews_done: 9,
  early_adopters_planned: 30,
  early_adopters_converted: 27,
  domain: "Lorem ipsum dolor sit amet",
  assumption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  method: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  observation: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  measure: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  learned: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  success_criteria: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.",
  action: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.
  Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum."
)
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
