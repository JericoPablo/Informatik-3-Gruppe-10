note
	author: "Tugrul Marek Thomas"
	date: "$Date$"
	revision: "$Revision$"

class
	NODE[G->{NUMERIC,COMPARABLE}]

create
	make

feature {NONE} -- Initialization

	make(new_value:G)
			-- Initialization for `Current'.
		do
			value := new_value
		end

feature {NONE} -- Attributes
	left: detachable NODE[G]		 -- Binarytree
	right: detachable NODE[G]
	parent: detachable NODE[G]
	value: G

feature {ANY} -- getter
	get_left: detachable NODE[G]
			-- Returns left node
	require
		current /= void
	do
		Result := left
	end

	get_right: detachable NODE[G]
			-- Returns right node
	require
		current /= void
	do
		Result := right
	end

	get_parent: detachable NODE[G]
			-- Returns parent node
	require
		current /= void
	do
		Result := parent
	end

	get_value: G
			-- Returns the value
	require
		current /= void
	do
		Result := value
	end

feature {BINARYTREE, NODE} -- setter

	set_left(new_node:detachable NODE[G])
			-- Sets left node
	do
		left := new_node
	ensure
		left = new_node
	end

	set_right(new_node:detachable NODE[G])
			-- Sets right node
	do
		right := new_node
	ensure
		right = new_node
	end

	set_parent(new_node:detachable NODE[G])
			-- Sets parent node
	do
		parent := new_node
	ensure
		parent = new_node
	end

	set_child(new_node:NODE[G])
			-- Sets chlid node if possible
	do
		new_node.set_parent(current)
		if new_node.get_value >= value then
			set_right(new_node)
		else
			set_left(new_node)
		end
	ensure
		new_node.get_parent /= void
	end

	set_value(new_value:G)
			-- Sets a new value
	do
		value := new_value
	ensure
		value = new_value
	end

end
