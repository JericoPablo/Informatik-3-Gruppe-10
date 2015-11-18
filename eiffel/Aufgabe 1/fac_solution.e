note
	author: "Tugrul Thomas Marek"
	date: "$Date$"
	revision: "$Revision$"

class
	FAC_SOLUTION

inherit
	SOLUTION

create
	make

feature {NONE} -- Initialization
	value : INTEGER

	make(n: INTEGER)
		do
			value := n
		end

feature {ANY} -- Getter

	get_Value: INTEGER
		do
			Result:=value
		end
end
