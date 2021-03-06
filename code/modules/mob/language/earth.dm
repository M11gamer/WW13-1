#define RUSSIAN_SYLLABLES list("al", "an", "bi", "vye", "vo", "go", "dye", "yel", "?n", "yer", "yet", "ka", "ko", "la", "ly", "lo", "l", "na", "nye", "ny", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "rye", "ro", "st", "ta", "tye", "to", "t", "at", "bil", "vyer", "yego", "yeny", "yenn", "yest", "kak", "ln", "ova", "ogo", "?l", "oro", "ost", "oto", "pry", "pro", "sta", "stv", "tor", "chto", "eto")
#define POLISH_SYLLABLES list("al", "an", "bi", "ve", "vo", "go", "de", "yel", "n", "yer", "yet", "ka", "ko", "la", "ly", "lo", "l", "na", "nee", "ny", "no", "ov", "ol", "on", "or", "slog", "ot", "po", "pr", "ra", "re", "ro", "st", "ta", "tye", "to", "t", "at", "bil", "ver", "ego", "eny", "enn", "est", "kak", "ln", "ova", "ogo", "l", "oro", "ost", "oto", "pry", "pro", "sta", "stv", "tor", "chto", "eto", "pa", "tu", "wa", "ugu")
#define GERMAN_SYLLABLES list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")
#define ITALIAN_SYLLABLES list("pi", "za", "pe", "pp", "er", "on", "i", "ma", "mia", "na", "va", "ta", "ra", "ga", "da", "na", "sa", "la", "te", "re", "ge", "de", "ne", "se", "le", "ti", "ri", "gi", "di", "ni", "si")

/datum/language/russian
	name = "Russian"
	desc = "slava sovyetskomu soyuzu!"
	key = "r"
	colour = "Russian"
	flags = RESTRICTED | COMMON_VERBS
	syllables = RUSSIAN_SYLLABLES
	mutual_intelligibility = list(/datum/language/ukrainian = 66,
		/datum/language/polish = 45)

/datum/language/ukrainian
	name = "Ukrainian"
	desc = "Smert' do radyans'koho soyuzu!"
	key = "u"
	colour = "Russian"
	flags = RESTRICTED | COMMON_VERBS
	syllables = list()
	mutual_intelligibility = list(/datum/language/polish = 75,
		/datum/language/russian = 70)

/datum/language/ukrainian/New()
	..()
	syllables = RUSSIAN_SYLLABLES|POLISH_SYLLABLES

/datum/language/polish
	name = "Polish"
	desc = "Smierc dla ciemiezców!"
	key = "p"
	colour = "Russian"
	flags = RESTRICTED | COMMON_VERBS
	syllables = POLISH_SYLLABLES
	mutual_intelligibility = list(/datum/language/ukrainian = 75,
		/datum/language/russian = 45)

/datum/language/german
	name = "German"
	desc = "Sieg heil!"
	key = "g"
	colour = "english"
	flags = RESTRICTED | COMMON_VERBS
	syllables = GERMAN_SYLLABLES

/datum/language/italian
	name = "Italian"
	desc = "Mama mia!"
	key = "i"
	colour = "english"
	flags = RESTRICTED | COMMON_VERBS
	syllables = ITALIAN_SYLLABLES
	mutual_intelligibility = list(/datum/language/romanian = 50)

/datum/language/romanian
	name = "Romanian"
	desc = "Mama mea!"
	key = "ro"
	colour = "english"
	flags = RESTRICTED | COMMON_VERBS
	syllables = list()
	mutual_intelligibility = list(/datum/language/italian = 50)

/datum/language/romanian/New()
	..()
	syllables = ITALIAN_SYLLABLES | list("vye", "vo", "go", "dye", "yel", "?n", "yer", "yet", "ka", "ko")