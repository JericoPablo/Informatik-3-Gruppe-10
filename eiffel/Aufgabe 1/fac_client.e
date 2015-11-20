note
	date        : "$Date$"
	revision    : "$Revision$"

class
	FAC_CLIENT

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization // None for private

	make
		local -- setting atributes
			fac : FAC_PROBLEM
			sol : FAC_SOLUTION
			variable: STRING
			zahl: INTEGER
		do
			-- creating empty tree, adding numbers, checking for numbers..

			print("%N Please type a Number")
			io.read_line
            variable := io.last_string.twin
            zahl:=variable.to_integer_32


			print("%N%NFakultaet %N%N")
			create fac.make (zahl)
			sol := fac.get_Solution
			print (sol.get_Value)



		end

end
