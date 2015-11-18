note
	author: "Thomas Marek Tugrul"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DIVISIBLE_PROBLEM

inherit
	PROBLEM

feature {NONE} -- Solving Problem

	is_directly_solvable: BOOLEAN
			-- Returns true, if problem is directly solvable
		deferred
		end

	solve
			-- Solves the problem
		deferred
		end

	part
			-- Solves subproblems
		deferred
		end

end
