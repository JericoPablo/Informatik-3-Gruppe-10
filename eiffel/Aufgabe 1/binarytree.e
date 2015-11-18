note
	author: "Tugrul Thomas Marek"
	date: "$Date$"
	revision: "$Revision$"

class --Class Binary Tree Comparable and Generic
	BINARYTREE[G->{COMPARABLE, NUMERIC}]

create
	default_empty
		-- Default Constructor

feature {NONE} -- Initialization

	default_empty
			-- Implementaion of Default Constructor.
			-- Initialization for `Current'.
			-- attributes to check if its empty or not
		do
			empty := TRUE
			size := 0
		ensure
			sucessfull_inizialisation_of_current: current /= void
		end

feature {NONE} -- Attributtes
	root: detachable NODE[G]
			-- Root node
	zero : detachable G
			-- Neutral element in the group (G,+)
	empty: BOOLEAN
			-- Boolean is true if tree root is void
	size: INTEGER
			-- Numer of elements in the treestructure

feature {ANY} -- Getter
			  -- Public visibility

	get_root: NODE[G]
			-- Returns the root-node of the treestructure if not empty
		require
			treestructure_is_not_empty: not is_empty
		do
			Result := attached_node(root)
		ensure
			result_is_attached: Result /= void
			result_is_root: Result.get_parent = void
		end


	get_size: INTEGER
			-- Returns number of nodes in the treestructure
		do
			Result := size
		end

	is_empty: BOOLEAN
			-- Returns true if the treestructure is empty
		do
			Result := empty
		end

feature {ANY} -- Routines

	add(new_value:G)
			-- Adds new value to the treestructure
		local
			new_node: NODE[G]
			tmp_node: NODE[G]
		do
			if not has(new_value) then
				create new_node.make(new_value)

				if is_empty then				-- Value is the first value wich get added
					root := new_node
					zero := new_value.zero		-- Sets the neutral element of the Group (G, +)
					size := 1
					empty := false
				else
					from
						tmp_node := attached_node(root)
					until
						(tmp_node.get_value > new_value and tmp_node.get_left = void) or
						(tmp_node.get_value < new_value and tmp_node.get_right = void)
					loop																		-- Serach for the next free pointer
						if tmp_node.get_value > new_value then
							tmp_node := attached_node(tmp_node.get_left)
						else
							tmp_node := attached_node(tmp_node.get_right)
						end
					end

					tmp_node.set_child(new_node)
					size := size + 1
				end
			else
				print("Tree already contains value %N")
			end

			ensure
				value_is_added: has(new_value)
		end

	remove(value:G)
			-- Deletes all nodes with the explizit value from the treestructure
		local
			tmp_node: NODE[G]
		do
			if not is_empty then
				from
					tmp_node := get_root
				until
					not has(value)
						-- Is true, if the value is deleted
				loop
					if tmp_node.get_value = value then
						remove_node(tmp_node)
					elseif tmp_node.get_value > value then
						tmp_node := attached_node(tmp_node.get_left)
					else
						tmp_node := attached_node(tmp_node.get_right)
					end
				end
			end

			ensure
				value_is_deleted: not has(value)
		end

	has(value: G): BOOLEAN
			-- Searches treestructure for explicit value and return true if found
		local
			tmp_node: detachable NODE[G]
			exists : BOOLEAN
		do
			exists := false
			if not is_empty then
				from
					tmp_node := get_root
				until
					exists or (tmp_node = void)
				loop
					if tmp_node.get_value = value then
						exists := true
					elseif tmp_node.get_value > value then
						tmp_node := tmp_node.get_left
					else
						tmp_node := tmp_node.get_right
					end
				end
			end
			Result := exists
		end

feature {PROBLEM, NONE} -- Subroutines

	remove_node(r_node: NODE[G])
			-- Deletes one explicit node from the treestructure
		local
			tmp_node: NODE[G]
			tmp_parent: NODE[G]
			tmp_value: G
		do
			if r_node.get_left = void and r_node.get_right = void then
				-- Node has no childs
				if r_node.get_parent = void then
						-- r_node is root
					root := void
					size := 0
					empty := true
				else
					tmp_parent := attached_node(r_node.get_parent)
					if tmp_parent.get_value > r_node.get_value then
						tmp_parent.set_left(void)
					else
						tmp_parent.set_right(void)
						r_node.set_parent(void)
					end
					size := size - 1
				end
			elseif r_node.get_left = void then
					-- r_node has a right-child
				tmp_node := attached_node(r_node.get_right)
				if r_node.get_parent = void then
						-- r_node is root
					root := tmp_node
					tmp_node.set_parent(void)
				else
					tmp_parent := attached_node(r_node.get_parent)
					tmp_parent.set_child(tmp_node)
				end
				size := size - 1
			elseif r_node.get_right = void then
					-- r_node has a left-child
				tmp_node := attached_node(r_node.get_left)
				if r_node.get_parent = void then
						-- r_node is root
					root := tmp_node
					tmp_node.set_parent(void)
				else
					tmp_parent := attached_node(r_node.get_parent)
					tmp_parent.set_child(tmp_node)
				end
				size := size - 1
			else
					-- r_node has both childs
				from
					tmp_node := attached_node(r_node.get_right)
				until
					tmp_node.get_left = void
				loop
					tmp_node := attached_node(tmp_node.get_left)
				end

				tmp_value := tmp_node.get_value
				r_node.set_value(tmp_value)
				remove_node(tmp_node)
			end
		end

feature -- Attach

	attached_node(d_node:detachable NODE[G]): attached NODE[G]
			-- Checks if the detachable node is attachhed and returens a attached node
		do
			check attached d_node as a_node then
				Result := a_node
			end
		end

	attached_value(d_value: detachable G): attached G
			-- Checks if the detachable value is attachhed and returens a attached value
		do
			check attached d_value as a_value then
				Result := a_value
			end
		end

invariant
	size_is_bigger_zero: get_size >= 0
	if_empty_then_size_is_zero: not is_empty or get_size = 0
end
