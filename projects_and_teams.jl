#!/usr/bin/env julia
###############################################################################

type Student
	name::AbstractString
	surname::AbstractString
	index::AbstractString
	email::AbstractString
	points::Int
end

type Team
	members::Vector{Student}
end

typealias URL AbstractString
type Spec
	text::AbstractString
	resources::Vector{URL}
end

type Solution
	repo::URL
	# Short youtube presentation.
	youtube::URL
	# download.bit HW+SW
	# Could set URL to file in github master blob.
	release_bit::URL
	# Short project documentation.
	# Could set URL to file in github master blob.
	doc::URL
end

type Project
	name::AbstractString
	points::Int
	min_team_members::Int
	team::Team
	spec::Spec
	solution::Solution
	done::Bool
end


###############################################################################

projects = Project[
	Project(
		"麻将 - Mahjong",
		45,
		4,
		Team(
			Student[
				Student(
					"Ime",
					"Prezime",
					"RA-117/2013",
					"lukicdarkoo@gmail.com",
					45
				),
			]
		),
		Spec(
			"""
TODO
			""",
			URL[
				URL(""),
			]
		),
		Solution(
			"https://github.com/...",
		),
		false
	),
]

additional = URL[
	"https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-9/12814673_1680231525591075_1051729422851094889_n.jpg?oh=36529770e78a7aa5f55afd6fe6d8c417&oe=57E5E5FB",
	"https://www.youtube.com/watch?v=RBa6gx5Mx5c",
	"https://scontent-vie1-1.xx.fbcdn.net/v/l/t1.0-9/13502065_1148717698525627_1747866040367180828_n.jpg?oh=10befb12e2527104db88d56c6019f86b&oe=57E81CBE",
	"https://www.youtube.com/watch?v=D3LpQkOpD20",
	"https://www.youtube.com/watch?v=4olSy5UXO_M"
]

###############################################################################

function no_of_students(project::Project)
	if project.team.members[1].name == "??"
		return 0
	else
		return length(project.team.members)
	end
end
N_students = sum(map(no_of_students, projects))
@show N_students

function project_taken(project::Project)
	!any(map((member) -> member.name == "??", project.team.members))
end

for project in projects
	if !project.done && project_taken(project)
		println("Not done: ", project.name)
	end
end

###############################################################################

