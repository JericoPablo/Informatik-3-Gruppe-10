note
	date        : "$Date$"
	revision    : "$Revision$"

class
	SEARCH_CLIENT

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization // None for private

	make
		local -- setting atributes
			tree : BINARYTREE[INTEGER]
			ser : SEARCH_PROBLEM
			ssol : SEARCH_SOLUTION
			variablel: STRING
			number: INTEGER
			x : INTEGER


           -- creating empty tree, adding numbers, checking for numbers..
		do

			create tree.default_empty
			variablel:="start"

			print("%N Add a few Numbers to the Tree  or enter 'finish' to finish %N")

			from
				x:= 0
			until
				(x>=1000)
			loop
					io.read_line
		            variablel := io.last_string.twin


		            if not variablel.is_equal ("finish") then
		            number:=variablel.to_integer_32
					tree.add (number)
					x:=x+1

		            else
		            print("%N done %N")
		            print("%N Checking if a Number is in the tree by Problemsolver. Type a number ! %N")

					io.read_line
				    variablel := io.last_string.twin
				    number:=variablel.to_integer_32

					create ser.make (number, tree)
					ssol := ser.get_solution
					print(ssol.get_value)
					print("%N")
				    end

			end




		end

end
