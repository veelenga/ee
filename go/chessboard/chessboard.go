package chessboard

// Declare a type named Rank which stores if a square is occupied by a piece - this will be a slice of bools
type Rank []bool

// Declare a type named Chessboard which contains a map of eight Ranks, accessed with keys from "A" to "H"
type Chessboard map[string]Rank

func CountRank(rank Rank) int {
	count := 0
	for _, x := range rank {
		if x {
			count ++
		}
	}
	return count
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank
func CountInRank(cb Chessboard, rank string) int {
	return CountRank(cb[rank])
}

// func FileNames(cb Chessboard) []string {
// 	count := 0
// 	keys := make([]string, len(cb))

// 	for k := range cb {
// 		keys[count] = k
// 		count ++
// 	}
// 	sort.Strings(keys)
// 	return keys
// }

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file
func CountInFile(cb Chessboard, file int) int {
	file --

	if (file < 0 || file > len(cb)) {
		return 0
	}

	count := 0
	for _, rank := range cb {
		if rank[file] {
			count ++
		}
	}
	return count
}

func NumberOfRanks(cb Chessboard) int {
	for _, r := range cb {
		return len(r)
	}
	return 0
}

// CountAll should count how many squares are present in the chessboard
func CountAll(cb Chessboard) int {
	return len(cb) * NumberOfRanks(cb)
}

// CountOccupied returns how many squares are occupied in the chessboard
func CountOccupied(cb Chessboard) int {
	count := 0
	for _, rank := range cb {
		count += CountRank(rank)
	}
	return count
}
