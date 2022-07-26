class Path
  attr_accesor :pos,:next
  def intialize(pos)
    @pos=pos
    @nextList=[]
    @prev=nil
  end
end

def kinght_moves(start_pos=[0,0],destination)
  board_size=8
  possible_moves = []
  visited_positions = []
  path=PathNode.new(start_pos)
  found = false

  until found
    possible_moves = jumps(path.pos)
    
    # check desitnation
    if possible_moves.contains?(destination)
      current_move.next=destination
      return     
    end

    # prune out of bounds
    possible_moves = possible_moves.select { |move| move[0] < board_size && move[0] >= 0 && move[1] < board_size && move[1] >= 0 }

    # prune visited
    possible_moves.each { |move|
      if visited_positions.contains?(move)
        possible_moves.delete(move)
      else
        visited_position.push(move)
      end
    }

    possible_moves.each { |move|
      path.next.push(move)
      jumps(move)
    }
  end

  def jumps(start_pos)
    # calc possible moves
    possible_moves.push([start_pos[0] + 2, start_pos[1] + 1])
    possible_moves.push([start_pos[0] - 2, start_pos[1] + 1])
    possible_moves.push([start_pos[0] - 2, start_pos[1] - 1])
    possible_moves.push([start_pos[0] + 2, start_pos[1] - 1])

    possible_moves.push([start_pos[0] + 1, start_pos[1] + 2])
    possible_moves.push([start_pos[0] - 1, start_pos[1] + 2])
    possible_moves.push([start_pos[0] - 1, start_pos[1] - 2])
    possible_moves.push([start_pos[0] + 1, start_pos[1] - 2])

    
    return possible_moves
  end
  
end

p kinght_moves