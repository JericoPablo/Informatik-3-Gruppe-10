note
	author: "Thomas Tugrul Marek"
	date: "$Date$"
	revision: "$Revision$"

class
	SEARCH_SOLUTION

inherit
	SOLUTION

create
	make

feature {NONE} -- Initialization
	value : BOOLEAN

	make(v:BOOLEAN)
			-- Initialization for `Current'.
		do
			value := v
		end

feature {ANY} -- Getter

	get_Value: BOOLEAN
		do
			Result:=value
		end


end
