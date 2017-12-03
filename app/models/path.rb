# Write a function that provides change directory (cd) function for an abstract file system.
#
# Notes:
#
# Root path is '/'.
# Path separator is '/'.
# Parent directory is addressable as '..'.
# Directory names consist only of English alphabet letters (A-Z and a-z).
# The function should support both relative and absolute paths.
# The function will not be passed any invalid paths.
# Do not use built-in path-related functions.
# For example:
#
# path = Path.new('/a/b/c/d')
# path.cd('../x')
# puts path.current_path
# should display '/a/b/c/x'.
class Path

  def initialize(path)
    @current_path = path
  end

  def current_path
    @current_path
  end

  def cd(new_path)
    new_path_array = new_path.split('/')
    current_path_array = @current_path.split('/')
    new_path_array.count('..').times {current_path_array.pop}
    new_path_array.delete('..')
    current_path_array += new_path_array
    @current_path = current_path_array.join('/')
  end
end