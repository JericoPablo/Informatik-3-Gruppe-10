note
	author: "Thomas Tugrul Marek"
	date: "$Date$"
	revision: "$Revision$"

class
	FAC_PROBLEM

inherit
	DIVISIBLE_PROBLEM

create
	make

feature {NONE} -- Initialization

	make (factor:INTEGER)
			-- Initialization for `Current'.
		do
			n := factor
			solve
		end

feature {NONE} -- Attributes
	n : INTEGER
	solution : FAC_SOLUTION

feature {PROBLEM} -- Solving Problem

	is_directly_solvable : BOOLEAN
		do
			if n = 0 then
				Result := true;
			else
				Result := false
			end
		end

	solve --just checking if the problem is directly solvable if not its parting
		do
			if  is_directly_solvable then
				solve_directly
			else
				part
			end
		end

	solve_directly --making solution because its directly solvable
		do
			create solution.make(1)
		end

	part --parting the problem
		local --local atributes
			p: FAC_PROBLEM
			s: FAC_SOLUTION
		do --breaking down till it is solvable
			create p.make(n-1)
			s := p.get_Solution
			create solution.make(s.get_Value*n)
		end

feature {ANY} -- GETTER

	get_Solution : FAC_SOLUTION
		do
			Result := solution
		end

end
