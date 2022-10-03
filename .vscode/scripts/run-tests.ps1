$FILE_NAME = ".\test-place.rbxl"
$TEST_PROJ = ".\tests\test.project.json"
$TEST_RUNR = ".\tests\test-runner.server.lua"

aftman install
rojo build "$TEST_PROJ" -o "$FILE_NAME"
run-in-roblox --place "$FILE_NAME" --script "$TEST_RUNR"
Remove-Item "$FILE_NAME" -Force -ErrorAction SilentlyContinue
