#!/usr/bin/env ruby

def parse_hand( input_line )
    valueref = {
        "C"  => 0, "D" => 20, "H" => 40, "S" => 60,
        "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14
    }
    hand = []
    rank = []
    pairs = 0
    three_of_kinds = 0
    cards = input_line.scan(/([SHDC])(10|[2-9TJQKA])/)
    
    if cards.size != 5 
        return "invalid input"
    end

    cards.each{ |c|
        rank.push( c[1].match(/\d+/)?(c[1].to_i):valueref[c[1]] )
        hand.push( valueref[c[0]] + rank[rank.size - 1] )
    }

    if hand.uniq.length != cards.length
        return "duplicated cards. don't cheat"
    end

    rank = rank.sort
    idx = 0
    while idx < 4
        if rank.rindex(rank[idx]) == idx + 3 then return "4C" end
        if rank.rindex(rank[idx]) == idx + 2
            three_of_kinds = 1
            idx += 3
            next
        end
        if rank.rindex(rank[idx]) == idx + 1
            pairs += 1
            idx += 2
            next
        end
        idx += 1
    end

    ((pairs > 0) and (three_of_kinds > 0)) ? "FH" : (
        three_of_kinds > 0 ? "3C" : (
            pairs > 0? (pairs.to_s+"P") : "--" 
        ) 
    )
end


ARGF.each do |input|
    print parse_hand( input ), "\n"
end

