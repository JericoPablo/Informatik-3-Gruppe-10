note
	author: "Thomas Marek Tugrul"
	date: "$Date$"
	revision: "$Revision$"

class
	SEARCH_PROBLEM

inherit
	DIVISIBLE_PROBLEM

create
	make,
	make_node

feature {NONE} -- Initialization
	searched : INTEGER
	node : detachable NODE[INTEGER]
	solution: SEARCH_SOLUTION

	make(n:INTEGER ; tree: BINARYTREE[INTEGER])
			-- Initialization for `Current'.
		do
			searched := n
			node := tree.get_root
			solve
		end

	make_node(n:INTEGER ; cur_Node: detachable NODE[INTEGER])
			-- Initialization for `Current'.
		do
			searched := n
			node := cur_Node
			solve
		end

feature {PROBLEM} -- Solving Problem if its possible to solve directly

		is_directly_solvable : BOOLEAN
			do
				if node = void then
					Result := true
				else
					check attached node as a_node then
						Result := a_node.get_Value = searched
					end
				end
			end

		solve
			do
				if is_directly_solvable then
					solve_directly
				else
					part  -- if not possible parting problem
				end

			end

		part  -- checking if the searched value is bigger or smaller then the current, and it begins from new, if not it gets the solution
			local
				p : SEARCH_PROBLEM
			do
				check attached node as a_node then
					if (searched > a_node.get_value) then
						create p.make_node(searched,a_node.get_right)
					else
						create p.make_node(searched,a_node.get_left)
					end
				end
				solution := p.get_solution
			end

			solve_directly
				do
					if node = void then
						create solution.make(false)
					else
						create solution.make(true)
					end
				end

feature {ANY} -- Getter

		get_Solution : SEARCH_SOLUTION
			do
				Result := solution
			end
end
