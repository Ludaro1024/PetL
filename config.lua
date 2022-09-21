Config = {}
Translation = {}
Config.bigDogModels = {
	"a_c_shepherd", "a_c_rottweiler", "a_c_husky", "a_c_retriever", "a_c_chop"
}

Config.smallDogModels = {
	"a_c_poodle", "a_c_pug", "a_c_westy"
}

Config.Pets = { -- job is for restricted jobs if u want that ;)
   {name = "Chop", model = "a_c_chop", price = 10, job= nil},
  -- {name = "Husky", model = "a_c_husky", price = 10, job= nil}, not working rn idk why
   {name = "retriever", model = "a_c_retriever", price = 10, job= nil},
   {name = "Shepherd", model = "a_c_shepherd", price = 10, job= nil},
   {name = "poodle", model = "a_c_poodle", price = 10, job= nil},
   {name = "Pug", model = "a_c_pug", price = 10, job= nil},
   {name = "Westy", model = "a_c_westy", price = 10, job= nil},
}

function notify(msg, source)
    ESX.ShowNotification(msg)
end

Config.PayWithBank = false
Config.NicknameLength = 12
Config.Debug = false
Config.SpawnRadius = 20
Config.Locale = 'en'
Config.Blip = false
Config.Currency = "€" 
Config.Blipname = "Pet-Shop!"
Config.Blipcoord = vector3(-569.0403, -1047.1871, 22.3297)
Config.BlipID = 477
Config.BlipColorID = 1
Config.MarkerID = 31


Translation = {
    ['de'] = {
        ['GetIncar'] = 'Befehl dem Hund ins auto zu Steigen',
        ['Calldog'] = 'Ruf dein Hund!',
        ['AttackPerson'] = 'Greif diese Person an!',
        ['FollowPerson'] = 'Folg dieser Person!',
        ['GoHere'] = 'Hundi Komm Hierher!',
        ['GoHome'] = 'Hundi geh nachhause.',
        ['Tricks'] = 'Tricks:',
        ['MainMenuName'] = "Haustier-Shop",
        ['MainMenuDesc'] = 'Alles was dein Hunde-Herz Begehrt!!',
        ['BuyMenuName'] = 'Haustier Kaufen!',
        ['notify'] = 'Drücke ~INPUT_CONTEXT~ um den Haustier-Shop zu Öffnen!',
        ['BuyItemName'] = 'Haustier-Kaufen',
        ['SellMenuName'] = 'Bist du Sicher das du dein Haustier Verkaufen willst?',
        ['yes'] = 'Ja',
        ['no'] = 'nein',
        ['sold'] = 'Du hast dein Haustier Erfologreich verkauft!',
        ['close'] = 'Menü Schließen',
        ['BuyItemDesc'] = 'Hier kannst du dein Haustier holen! <3',
        ['Bought'] = 'Du hast ein Haustier gekauft! <3',
        ['ChooseNickname'] = 'Gib deinem Haustier ein Spitzname! <3',
        ['SellItemName'] = 'Haustier-verkaufen',
        ['SellItemDesc'] = 'Hier kannst du dein Haustier Zurrückgeben ;('
    },
    ['en'] = {
        ['GetIncar'] = 'Tell your dog to get in the car',
        ['Calldog'] = 'Call your dog',
        ['AttackPerson'] = 'Tell your dog to Attack this Person',
        ['FollowPerson'] = 'Tell your dog to Follow this Person!',
        ['GoHere'] = 'Tell your dog to go there',
        ['GoHome'] = 'Tell your dog to go home',
        ['Tricks'] = 'Tricks',
        ['MainMenuName'] = 'Pet-Shop',
        ['BuyMenuName'] = 'Buy A pet Here!',
        ['MainMenuDesc'] = 'everything that your Pet-Heart Desires!',
        ['BuyItemName'] = 'Buy a Pet!',
        ['SellMenuName'] = 'Are you sure you wanna sell your Pet?',
        ['yes'] = 'yes',
        ['no'] = 'no',
        ['close'] = 'Close',
        ['sold'] = 'You Sold your Pet!',
        ['Bought'] = 'You Bought a Pet! <3',
        ['BuyItemDesc'] = 'you can get a Pet here! <3',
        ['ChooseNickname'] = 'Give your Pet a Nickname!',
        ['SellItemName'] = 'Sell your Pet!',
        ['SellItemDesc'] = 'you can give back your pet here ;(',
        ['notify'] = 'Press ~INPUT_CONTEXT~ to open the Pet-Shop'
    }
}