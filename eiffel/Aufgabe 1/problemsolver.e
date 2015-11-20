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

			print("%NAdding 7%N")
			tree.add (7)
			print("%NAdding 3%N")
			tree.add (3)
			print("%NAdding 12%N")
			tree.add (12)
			print("%NAdding 4%N")
			tree.add (4)
			print("%NAdding 6%N")
			tree.add (6)
			print("%NAdding 2%N")
			tree.add (2)
			print("%NAdding 9%N")
			tree.add (9)
			print("%NAdding 1%N")
			tree.add (1)
			print("%NAdding 15%N")
			tree.add (15)
			print("%NAdding 8%N%N")
			tree.add (8)
			print("%NChecking if 7 is in%N")
			print(tree.has (7))
			print("%N%NChecking if 1 is in%N")
			print(tree.has (1))


			print("%N%NFakultaet 4%N")
			create fac.make (4)
			sol := fac.get_Solution
			print (sol.get_Value)

			print("%N%NChecking if 5 is in, by Problemsolver%N")
			create ser.make (5, tree)
			ssol := ser.get_solution
			print(ssol.get_value)
			print("%N")

			print("%NCheking if 6 is in")
			print(tree.has (6))
			print("%NDeleting 6%N")
			tree.remove (6)
			print("%NChecking again if 6 is in%N")
			print(tree.has (6))
			print("%N")


		end

end
