set -euo pipefail
[[ $# -eq 1 ]] || { echo "Usage: $0 <input.json>"; exit 1; }
infile=$(realpath "$1")
outfile="${infile%.*}.csv"

./jq -r '
  "I,S,T",
  .[] | objects | [ (.I | tostring), .S, .T ] | join(",")
' "$infile" > "$outfile"

echo "Converted: $infile -> $outfile"
