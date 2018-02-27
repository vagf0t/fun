# In a binary tree, if in the path from root to the node A, there is no node with greater value than A’s, this node A is
# visible. We need to count the number of visible nodes in a binary tree.

def recursive (node, ancestor_value)
  return 0 unless node

  max = [ancestor_value, node.x].max
  if (node.x >= ancestor_value)
    return 1 + recursive(node.l, max) + recursive(node.r, max)
  else
    return recursive(node.l, max) + recursive(node.r, max);
  end
end

def solution(t)
  return recursive t, -100001
end