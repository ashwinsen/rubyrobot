class CircularList
  def initialize(array)
    @arr = array
  end

  def size
    @arr.size
  end

  def fetch_previous(index=0)
    index.nil? ? nil : @arr.unshift(@arr.pop)[index]
  end

  def fetch_next(index=0)
    index.nil? ? nil : @arr.push(@arr.shift)[index]
  end

  def rotate_to(obj)
    hash = Hash[@arr.map.with_index.to_a]
    hash[obj].times { fetch_next } && return if hash[obj]
    nil
  end
end
