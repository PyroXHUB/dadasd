local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PyroX HUB 🔥", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "About US",
	Icon = "rbxassetid://17586615444",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "What We Offer"
})
Tab:AddParagraph("WE OFFER","We offer a safety cheats for all the players and legitimate trade scam/duping and more! JOIN DISCORD TO KEEP UPDATED")
local Section = Tab:AddSection({
	Name = "Discord"
})
Tab:AddButton({
	Name = "JOIN DISCORD",
	Callback = function()
        setclipboard("https://discord.gg/uhMe5vhu")
  	end    
})
local Tab = Window:MakeTab({
	Name = "Breakables",
	Icon = "rbxassetid://17586562481",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Farming Settings"
})
Tab:AddToggle({
	Name = "Start Farming",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Farming Mode",
	Default = "Single",
	Options = {"Single", "All"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Target Breakables (Comets, Pinatas, Lucky Blocks, Etc)",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Drops Settings"
})
Tab:AddToggle({
	Name = "Collect Orbs/Lootbags",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Tapping Settings"
})
Tab:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Tapping Mode",
	Default = "Current Breakable",
	Options = {"Current Breakable", "Aura"},
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Misc"
})
Tab:AddToggle({
	Name = "Stats Tracker",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Infinite Pet Speed",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Teleport To Current Zone",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Use Items"
})
Tab:AddToggle({
	Name = "Use Ultimate",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Fruits",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Fruits",
	Default = "None",
	Options = {"Watermelon", "Candy Cane","Apple","Rainbow","Pineapple","Orange","Banana"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Flags",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Flags",
	Default = "Magnet Flag",
	Options = {"Golden Flag", "Hasty Flag","Magnet Flag","Exotic Treasure Flag","Strength Flag","Coins Flag","Fortune Flag","Rainbow Flag","Diamonds Flag","Shiny Flag"},
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Alt Farming Settings"
})
Tab:AddToggle({
	Name = "Auto Unlock Next Zone",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Buy Pet Slots",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Buy Egg Slots",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Tab = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://17587193724",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Egg Settings"
})
Tab:AddToggle({
	Name = "Start Hatching",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "World 1 Egg",
	Default = "Cracked Egg",
	Options = {"Cracked Egg","Spotted Egg","Paw Egg","Grass Egg","Wood Egg","Pumpkin Egg","Hive Egg","Acorn Egg","Blossom Egg","Corgi Egg","Cat Egg","Dog Egg","Dragon Egg","Rock Egg","Geode Egg","Hut Egg","Grave Egg","Spike Egg","Sprout Egg","Mushroom Egg","Spirit Egg","Crimson Egg","Overgrown Egg","Mossy Egg","Jungle Egg","Sandcastle Egg","Palm Tree Egg","Beach Ball Egg","Coral Egg","Anchor Egg","Atlantis Egg","Tropical Egg","Beach Egg","Coconut Egg","Tiki Egg","Sand Bucket Egg","Sunny Egg","Pirate Egg","Ship Egg","Zebra Egg","Cheetah Egg","Cactus Egg","Fossil Egg","Egyptian Egg","Sandstone Egg","Cowboy Egg","Canyon Egg","Hyena Egg","Melted Egg","Snow Egg","Icicle Egg","Snowman Egg","Yeti Egg","Ice Egg","Thawed Egg","Magma Egg","Obsidian Egg","Volcano Egg","Bone Egg","Tentacle Egg","Hell Egg","Metal Egg","Sakura Egg","Ninja Egg","Lantern Egg","Bonsai Egg","Garden Egg","Pixie Egg","Pedal Egg","Crowned Egg","Royal Egg","Dandelion Egg","Colorful Egg","Colorful Geode Egg","Colorful Mosaic Egg","Frosted Geode Egg","Ice Sculpture Egg","Hot Cocoa Egg","Ice Castle Egg","Teddy Egg","Firefly Egg","Golden Brick Egg","Cobblestone Egg","Ruins Egg","Runic Egg","Wizard Egg","Witch Egg","Eerie Egg","Abyssal Egg","Cursed Egg","Dungeon Egg","Shadow Egg","Treasure Egg","Empyrean Egg","Mythic Egg","Cotton Candy Egg","Gummy Egg","Ice Cream Egg","Sweets Egg","Toy Egg","Carnival Egg","Hot Air Balloon Egg","Cloud Egg","Cloud Garden Egg","Cloud Forest Egg","Cloud House Egg","Cloud Castle Egg","Angel Egg","Heaven Egg","Heaven Castle Egg","Colorful Cloud Egg","Rainbow Egg"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "World 2 Egg",
	Default = "Tech Circuit Egg",
	Options = {"Tech Circuit Egg", "Tech City Egg","Tech Forest Egg","Tech Silo Egg","Tech Data Egg","Tech Cuboid Egg","Tech Sprout Egg","Tech Tree Egg","Tech Incubator Egg","Tech Overgown Egg","Tech Magna Egg","Tech Oasis Egg","Tech Palm Egg","Tech Coral Egg","Tech Ship Egg","Tech Ruins Egg","Tech Dusty Egg","Tech Luminati Egg","Tech Cactus Egg","Tech Cowboy Egg","Tech Canyon Egg","Tech Snow Egg","Tech Mossy Egg","Tech Ice Crystal Egg","Tech Flurry Egg","Tech Ice Circuit Egg","Tech Glacier Egg","Tech Melted Egg","Tech Nexus Egg","Nuclear Crack Egg","Nuclear Forest Egg","Nuclear Mine Dog","Nuclear Egg","Tech Rocket Egg","Tech Planets Egg","Tech Moon Egg","Tech Mars Egg","Tech Saturn Egg","Tech Comet Egg","Tech Galaxy Egg","Electric Garden Egg","Electric City Egg","Electric Forest Egg","Electric Egg","Tech Factory Egg","Tech Robot Egg","Tech Hive Egg","Alien Garden Egg","Alien Forest Egg","Alien Lab Egg","Alien UFO Egg","Space Forge Egg","Space Factory Egg","Space Junkyard Egg","Steampunk Gears Egg","Steampunk Lantern Egg","Steampunk Clockwork Egg","Steampunk Airship Egg","Motherboard Egg","Aura Egg","Wizard Ruins Egg","Wizard Temple Egg","Wizard Forest Egg","Wizard Tower Egg","Wizard Dungeon Egg","Cyberpunk Undercity Egg","Cyberpunk Industrial Egg","Cyberpunk City Egg","Cyberpunk Road Egg","Tech Kyoto Egg","Tech Samurai Egg","Tech Dojo Egg","Tech Sakura Egg","Dominus Rex Egg","Dominus Frigidus Egg","Dominus Infernus Egg","Holographic Pipes Egg","Holographic Egg","Holographic Tree Egg","Holographic Cystal Egg","Dark Tech Stone Egg","Dark Tech Relic Egg","Dark Tech Brick Egg","Dark Tech Spike Egg","Hacker Metal Egg","Hacker Gear Egg","Hacker Matrix Egg","Hacker Error Egg","Glitch Tree Egg","Glitch Green Egg","Glitch Aqua Egg","Glitch Cyan Egg","Quantum Egg","Quantum Leafy Egg","Quantum Space Egg","Quantum Galaxy Egg","Void Crystal Egg","Voic Fracture Egg","Void Spiral Egg"},
	Callback = function(Value)
		print(Value)
	end
})
Tab:AddDropdown({
	Name = "World 3 Egg",
	Default = "Rusty Egg",
	Options = {"Rusty Egg", "Striped Egg","Cinderblocks Egg","Lootbag Egg"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Teleport To Egg",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Egg Notifications"
})
Tab:AddToggle({
	Name = "Start Webhook Notifications",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddTextbox({
	Name = "Discord Webhook",
	Default = "Webhook",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab:AddDropdown({
	Name = "Rarities",
	Default = "Exclusive",
	Options = {"Exclusive", "Mythical","Exotic","Celestial","Rare","Legendary","Basic","Epic","Superior","Secret","Divine"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Ping Discord User",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddTextbox({
	Name = "Discord UserID",
	Default = "UserID",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab:AddToggle({
	Name = "Show Username",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Tab = Window:MakeTab({
	Name = "Minigames",
	Icon = "rbxassetid://17588134400",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Fishing Settings"
})
Tab:AddToggle({
	Name = "Start Fishing",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Fishing Speed",
	Default = "Normal",
	Options = {"Normal", "Fast","Rapid"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Area",
	Default = "Fishing",
	Options = {"Fishing", "Advanced Fishing"},
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Digging Settings"
})
Tab:AddToggle({
	Name = "Start Digging",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Digging Speed",
	Default = "Normal",
	Options = {"Normal", "Fast","Rapid"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Area",
	Default = "Digsite",
	Options = {"Digsite", "Advanced Digsite"},
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Normal Minigames"
})
Tab:AddToggle({
	Name = "Start Minigames",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Minigames",
	Default = "Classic Obby",
	Options = {"Classic Obby", "Cart Ride Into Preston","Minefield","Atlantis","Jungle Obby","Pyramid Obby","Sled Race","Ice Obby","Chest Rush","Flower Garden"},
	Callback = function(Value)
		print(Value)
	end    
})
local Tab = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://17588074573",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Player Upgrades"
})
Tab:AddButton({
	Name = "Purchase All Player Upgrades",
	Callback = function()
      		print("button pressed")
  	end    
})
local Section = Tab:AddSection({
	Name = "Tickets/Keys"
})
Tab:AddToggle({
	Name = "Use Void Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Prison Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Golden Prison Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Tech Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Crystal Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Secret Key",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Void Tickets",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Tech Tickets",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Normal Tickets ",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Tab = Window:MakeTab({
	Name = "Special",
	Icon = "rbxassetid://17588143790",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Rank/Quest"
})
Tab:AddToggle({
	Name = "Start Auto Rank",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Start Zone Quest",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddToggle({
	Name = "Start Clan Quest",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Section = Tab:AddSection({
	Name = "Trade Scam"
})
Tab:AddTextbox({
	Name = "Victim's Username",
	Default = "User",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab:AddToggle({
	Name = "Start Trade Scam",
	Default = false,
	Callback = function(Value)
		wait(5)
		local message = require(game.ReplicatedStorage.Library.Client.Message)
		message.Error("Trade Scam Activated✅ Enjoy Getting Easy Huges🤑")
	end    
})
local Section = Tab:AddSection({
	Name = "Huge Duping"
})
Tab:AddToggle({
	Name = "Start Duping",
	Default = false,
	Callback = function(Value)
		wait(5)
		local message = require(game.ReplicatedStorage.Library.Client.Message)
		message.Error("DUPED SUCCESS🤑 PLEASE CHECK YOUR INVENTORY👾")
	end    
})
Tab:AddTextbox({
	Name = "Amount",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab:AddDropdown({
	Name = "Rarity",
	Default = "Huge",
	Options = {"Huge", "Exclusive"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab:AddParagraph("TITANIC DUPING","IF YOU WANT TO DUPE A TITANIC, KINDLY CREATE A TICKET ON MY DISCORD SERVER AND TELL US THAT YOU WANT TO DUPE A TITANIC SO WE CAN SEND YOU THE SCRIPT FOR DUPING THE TITANIC.. THANK YOUU")
OrionLib:Init()