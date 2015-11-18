note
	date        : "$Date$"
	revision    : "$Revision$"

class
	PROBLEMSOLVER

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization // None for private

	make
		local -- setting atributes
			tree : BINARYTREE[INTEGER]
			fac : FAC_PROBLEM
			sol : FAC_SOLUTION
			ser : SEARCH_PROBLEM
			ssol : SEARCH_SOLUTION
		do
			-- creating empty tree, adding numbers, checking for numbers..
			create tree.default_empty

			tree.add (7)
			tree.add (3)
			tree.add (12)
			tree.add (4)
			tree.add (6)
			tree.add (2)
			tree.add (9)
			tree.add (1)
			tree.add (15)
			tree.add (8)
			print("%NChecking if 7 is in%N")
			print(tree.has (7))
			print("%NChecking if 1 is in%N")
			print(tree.has (1))


			print("%N%NFakultaet 4%N%N")
			create fac.make (4)
			sol := fac.get_Solution
			print (sol.get_Value)

			print("%NChecking if 5 is in, by Problemsolver%N")
			create ser.make (5, tree)
			ssol := ser.get_solution
			print(ssol.get_value)
			print("%N")

			print("%NCheking if 6 is in%N")
			print(tree.has (6))
			print("%NDeleting 6%N")
			tree.remove (6)
			print("%NChecking again if 6 is in%N")
			print(tree.has (6))


		end

end
